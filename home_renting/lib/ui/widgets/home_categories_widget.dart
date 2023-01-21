import 'package:flutter/material.dart';
import 'package:home_renting/core/constants/constants.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int _index = 0;

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < categories.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        label: Text(
          categories[i],
        ),
        labelStyle:_index == i ? categorySelectedStyle:searchHintTextStyle ,
        backgroundColor: kgreyColor,
        selectedColor: kcategoryBackgroundColor,
        selected: _index == i,
        onSelected: (value) {
          setState(() {
            if (value) {
              _index = i;
            }
          });
        },
      );
      chips.add(
        Container(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: choiceChip,
        ),

      );
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          SizedBox(
            height: 30,
            child: _buildChips(),
          ),
        ],
      );
  }
}
