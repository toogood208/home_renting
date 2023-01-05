import 'package:image_picker/image_picker.dart';

class ImageSelectorservice {
  Future<XFile?> selectImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<List<XFile?>> selectMultipleImages() async {
    return await ImagePicker().pickMultiImage();
  }
}
