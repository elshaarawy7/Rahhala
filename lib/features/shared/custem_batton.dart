import 'package:flutter/material.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/home/pages/home_page.dart';

class CustemBatton extends StatelessWidget {
  const CustemBatton({super.key, required this.text, this.onTap}); 

  final String text ;
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 75, 
       width: double.infinity,
       margin: EdgeInsets.symmetric(horizontal: 20), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12) , 
          color:AppColors.primaryColor, 
        ), 
        child: Center(
          child: Text(text , style: TextStyle(
            color: Colors.white , 
            fontSize: 20 , 
            fontWeight: FontWeight.bold , 
          ),),
        ),
      ));
  }
}