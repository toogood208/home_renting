import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_renting/ui/shared/text_styles.dart';


class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    required this.appBarTitle,
    required this.mainBodyText,
    required this.subBodyText,
    required this.onTap
  });

  final String appBarTitle;
  final String mainBodyText;
  final String subBodyText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/empty2.png",
                  width: 311.w,
                  height: 364.h,
                ),
                SizedBox(height: 24.h),
                Text(
                  mainBodyText,
                  style: onboardingTitleTextStyle,
                ),
                SizedBox(height: 8.h),
                Text(
                 subBodyText,
                  style: bodySmallTextTile,
                ),
                SizedBox(height: 24.h),
               
              ],
            ),
          ],
        ));
  }
}