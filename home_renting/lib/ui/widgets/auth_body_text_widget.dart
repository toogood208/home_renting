import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class AuthBodyTextWidget extends StatelessWidget {
  const AuthBodyTextWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,//"do not have an account?",
          style: authBodyTextTextStyle,
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap:onTap,
          child: Text(
           secondText, //"Sign up", 
            style: authBodyTextTextStyle,
          ),
        ),
      ],
    );
  }
}