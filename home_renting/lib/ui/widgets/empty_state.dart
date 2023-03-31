import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';

import '../shared/colors.dart';

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
        appBar: CustomAppBar(title: appBarTitle),
        body: Center(
          child: Column(
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
              InkWell(
                onTap: onTap,
                child: Ink(
                  
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  width: 133.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        'Add Property',
                        style: bodySmallTextWhiteTile,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}