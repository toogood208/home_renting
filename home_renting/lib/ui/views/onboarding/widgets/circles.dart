import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';

class ActiveCircle extends StatelessWidget {
  const ActiveCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.02,
      width: screenSize.width * 0.03,
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
    );
  }
}

class InActiveCircle extends StatelessWidget {
  const InActiveCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.02,
      width: screenSize.width * 0.02,
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }
}
