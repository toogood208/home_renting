import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class NearYouWidget extends StatelessWidget {
  const NearYouWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: nearYouTextStyle,
        ),
        Text(
          "See More",
          style: searchHintTextStyle,
        ),
      ],
    );
  }
}
