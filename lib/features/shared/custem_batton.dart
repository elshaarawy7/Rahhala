import 'package:flutter/material.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class CustemBatton extends StatelessWidget {
  const CustemBatton({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: CustemText(
            text: text,
            color: Colors.white,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
