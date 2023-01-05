import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadImage({
    required File imageToUpload,
    required String title,
  }) async {
    final imageFileName =
        title + DateTime.now().microsecondsSinceEpoch.toString();
    Reference fireBaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    UploadTask uploadTask = fireBaseStorageRef.putFile(imageToUpload);
    final downloadUrl = await (await uploadTask).ref.getDownloadURL();
    final url = downloadUrl.toString();
    return CloudStorageResult(imageUrl: url, imageFileName: imageFileName);
  }

  Future<List<CloudStorageResult>> uploadMultipleImages(
      {required List<File> images, required String title})async{
    final imageList = await Future.wait(
        images.map((image) => uploadImage(imageToUpload: image, title: title)));
    return imageList;
  }

  Future deleteImage(String imageFileName) async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;
  CloudStorageResult({required this.imageUrl, required this.imageFileName});
}
