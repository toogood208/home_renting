import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomTextShadeWidget extends StatelessWidget {
  const CustomTextShadeWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), 
          color:color,
          ),
      child: Text(
       title,
        style: priceTextStyle,
      ),
    );
  }
}