import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/home_model.dart';
import 'package:home_renting/core/models/user.dart';

class FireStoreService {
  final CollectionReference _userCollectionRefernce =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference _rentCollectionRefernce =
      FirebaseFirestore.instance.collection('rent');

  final StreamController<List<HomeModel>> _propertyController =
      StreamController<List<HomeModel>>.broadcast();

  final log = getLogger("FireStoreService");

  Future getUser(String uid) async {
    try {
      final userData = await _userCollectionRefernce.doc(uid).get();

      return UserModel.fromData(userData.data() as Map<String, dynamic>);
    } catch (e) {
      return e.toString();
    }
  }

  Future createUser(UserModel user) async {
    try {
      await _userCollectionRefernce.doc(user.id).set(user.toJoson());
    } catch (e) {
      return e.toString();
    }
  }

  Future addRent(HomeModel homeModel) async {
    try {
      await _rentCollectionRefernce.add(homeModel.toMap());
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future getPropertiesOneOff() async {
    try {
      final postDocuments = await _rentCollectionRefernce.get();
      List<HomeModel> snap = postDocuments.docs
          .map((e) => HomeModel.fromMap(e.data() as Map<String, dynamic>, e.id))
          .toList();
      return snap;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream listenToPropertyRealTime() {
    _rentCollectionRefernce.snapshots().listen((event) {
      if (event.docs.isNotEmpty) {
        final property = event.docs
            .map((e) =>
                HomeModel.fromMap(e.data() as Map<String, dynamic>, e.id))
            .toList();
        _propertyController.add(property);
      }
    });

    return _propertyController.stream;
  }

  Future deleteProperty(String documentId) async {
    await _rentCollectionRefernce.doc(documentId).delete();
  }

  Future updateProperty(HomeModel property) async {
    try {
      await _rentCollectionRefernce
          .doc(property.docId)
          .update(property.toMap());
      return true;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
