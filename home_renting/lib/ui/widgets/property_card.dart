import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/widgets/convinence_row.dart';
import 'package:home_renting/ui/widgets/custom_text_shade_widget.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    Key? key,
    required this.property,
    this.onTap,
  }) : super(key: key);

  final Property property;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(property.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${property.numberOfBedrooms} Bedroom(s) at ${property.location}',
                  style: nearYouTextStyle,
                ),
                const SizedBox(height: 8),
                CustomTextShadeWidget(
                  title: "${property.price}/year",
                  color: primaryColor.shade50,
                ),
                const SizedBox(height: 5),
                ConvinenceRowWidget(home: property),
              ],
            )
          ],
        ),
      ),
    );
  }
}
