import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:lottie/lottie.dart';



class PageViewImage extends StatelessWidget {
  const PageViewImage(
      {Key? key,
        required this.image,
        required this.title,
        required this.subtitle})
      : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Lottie.asset(
            image,
            width: 300,
            height: 300,
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:onboardingTitleTextStyle,
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Text(
              subtitle,
             // style: kOnboardingSubtitleTextStyle,
            ),
          ],
        ),

      ],
    );
  }
}