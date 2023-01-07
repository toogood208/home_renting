import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class ConvinenceWidget extends StatelessWidget {
  const ConvinenceWidget({
    Key? key,
    required this.numberOfConvinience,
   required this.convinienceIconData,
  }) : super(key: key);

  final String numberOfConvinience;
  final IconData convinienceIconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          numberOfConvinience,
          style: searchHintTextStyle,
        ),
        const SizedBox(width: 5),
        FaIcon(
          convinienceIconData,
          color:kblackColor,
          size: 12.18,
        ),
      ],
    );
  }
}