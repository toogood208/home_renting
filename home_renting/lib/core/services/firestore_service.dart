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

  Future getProperties() async {
    try {
      final postDocuments = await _rentCollectionRefernce.get();
      log.v(postDocuments);
      if (postDocuments.docs.isNotEmpty) {
        return postDocuments.docs
            .map((snapshot) =>
                HomeModel.fromMap(snapshot.data() as Map<String, dynamic>))
            //  .where((mappedItem) => mappedItem.id != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
