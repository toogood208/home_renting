import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight
  }) : super(key: key);
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: kappBackgeroundColor,
      title: Text(title, style: appTitletextStyle),
      centerTitle: true,
      // title: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       "Location",
      //       style: appTitleLocationTextStyle,
      //     ),
      //     Row(
      //       children: [
      //         Text(
      //           "Lagos",
      //           style: appTitleMainLocationTextStyle,
      //         ),
      //         Icon(
      //           Icons.arrow_drop_down,
      //           color: kgreyColor,
      //         )
      //       ],
      //     ),
      //   ],
      // ),
      // actions: [
      //   IconButton(
      //       onPressed: (() {}),
      //       icon: Icon(
      //         Icons.notifications,
      //         color: kblackColor,
      //       ))
      // ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize =>Size.fromHeight(height);
}