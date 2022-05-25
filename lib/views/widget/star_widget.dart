import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final double value;
  const StarWidget({Key? key, this.value = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value - 1 ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
