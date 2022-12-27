import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.busy = false,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InkWell(
        child: AnimatedContainer(
          height: busy? 48: null,
          width: busy? 48: null,
           alignment: Alignment.center,
          duration: const Duration(milliseconds: 300),
           padding: EdgeInsets.symmetric(
              horizontal: busy ? 10 : 15,
              vertical: busy ? 10 : 10),
          decoration: BoxDecoration(
              color: primaryColor.shade900,
              borderRadius: BorderRadius.circular(6)),
          child:!busy? Center(
            child: Text(
              title,
              style: buttonTextStle,
            ),
          ): const CircularProgressIndicator(strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
        ),
      ),
    );
  }
}
