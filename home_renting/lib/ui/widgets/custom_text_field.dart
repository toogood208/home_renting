import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.suffixIcon,
    required this.textInputType,
    this.obscureText = false,
    this.controller,
    this.maxlines = 1,
    this.contentPadding,
    this.validator,
  }) : super(key: key);
  final String title;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxlines;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: bodySmallTextTile),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.only(left: 12),
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: neutralColor.shade200),
              borderRadius: BorderRadius.circular(6)),
          child: TextFormField(
            maxLines: maxlines,
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
                contentPadding: contentPadding,
                isDense: true,
                errorStyle:errorBodyTextTextStyle ,
                border: InputBorder.none,
                hintText: title,
                hintStyle: textFieldHintTextStyle,
                suffixIcon: suffixIcon),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
