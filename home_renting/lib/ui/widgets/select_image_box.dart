import 'dart:io';

import 'package:flutter/material.dart';

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
        height: 250,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: selectedImage == null
            ? Text(
                'Tap to add post image',
                style: TextStyle(color: Colors.grey[400]),
              )
            // If we have a selected image we want to show it
            : Image.file(selectedImage!),
      ),
    );
  }
}