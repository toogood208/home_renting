import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: kgreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: kHintSearchColor,),
        hintText: "Search by address near you",
        hintStyle: searchHintTextStyle,
        fillColor: kgreyColor,
        border: InputBorder.none
      ),
    ),
    );
  }
}