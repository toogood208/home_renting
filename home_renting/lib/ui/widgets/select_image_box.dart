import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectImageBoxWidget extends StatelessWidget {
  const SelectImageBoxWidget({
    Key? key,
    required this.selectImage,
    required this.selectedImage,
  }) : super(key: key);
  final Function() selectImage;
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child: Container(
        height: 400.h,
        decoration: BoxDecoration(
            color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: selectedImage == null
            ? Text(
                'Tap to add post image',
                style: TextStyle(color: Colors.blue[400]),
              )
            // If we have a selected image we want to show it
            : Image.file(selectedImage!),
      ),
    );
  }
}