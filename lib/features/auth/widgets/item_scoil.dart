import 'package:flutter/material.dart';

class ItemScoil extends StatelessWidget {
  const ItemScoil({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Image.asset(image),
    );
  }
}
