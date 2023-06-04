import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, required this.title, this.height = kToolbarHeight, this.actions})
      : super(key: key);
  final String title;
  final double height;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: kappBackgeroundColor,
      title: Text(title, style: appTitletextStyle),
        iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      actions: actions,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
