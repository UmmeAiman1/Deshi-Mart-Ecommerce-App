
import 'package:flutter/material.dart';

class CategoryData extends StatelessWidget {
  final Color color;
  final Image image;
  final Color borderColor;
  final String title;
  const CategoryData(
      {super.key,
      required this.color,
      required this.borderColor,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 189,
      width: 174,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(18)),
        color: color,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          image,
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
