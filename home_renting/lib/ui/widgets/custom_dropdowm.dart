import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required List<String> categories,
    required this.value,
    required this.onchanged,
    required this.title,
  })  : _categories = categories,
        super(key: key);

  final List<String> _categories;
  final String value;
  final Function(String? value) onchanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: bodySmallTextTile),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: neutralColor.shade200),
                borderRadius: BorderRadius.circular(6)),
            child: DropdownButton(
              underline: const SizedBox(),
              value: value,
              items: _categories
                  .map(
                    (String item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: onchanged,
            ),
          ),
        ),
      ],
    );
  }
}
