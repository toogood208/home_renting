import 'package:flutter/material.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 13.2,
                ))),
      ),
    );
  }
}