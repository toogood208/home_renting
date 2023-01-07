import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/widgets/convinience_widget.dart';

class ConvinenceRowWidget extends StatelessWidget {
  const ConvinenceRowWidget({
    Key? key,
    required this.home,
  }) : super(key: key);

  final Property home;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConvinenceWidget(
          numberOfConvinience: home.numberOfBedrooms,
          convinienceIconData: FontAwesomeIcons.bed,
        ),
        const SizedBox(width: 20),
        ConvinenceWidget(
          numberOfConvinience: home.numberOfBathroom,
          convinienceIconData:
            FontAwesomeIcons.bath,
        ),
      ],
    );
  }
}