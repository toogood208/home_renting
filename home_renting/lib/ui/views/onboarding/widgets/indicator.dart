import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator(
      {super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color:
          positionIndex == currentIndex ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}