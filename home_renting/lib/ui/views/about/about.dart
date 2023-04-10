

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "About"),
      body: SafeArea(
        child: SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Version", style: onboardingTitleTextStyle,),
              Text("1.0.0", style: appTitleMainLocationTextStyle,)
      
            ],
          ),
        ),
      ),
    );
  }
}