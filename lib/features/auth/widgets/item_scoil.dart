import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemScoil extends StatelessWidget {
  const ItemScoil({super.key, required this.image}); 
  final String image; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, 
      height: 100, 

      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(image),
    );
  }
}