import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_batton.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';
import 'package:user_inter_face_2/features/shared/custem_text_filed.dart';

class SingInPage extends StatelessWidget {
   SingInPage({super.key}); 

   TextEditingController NameContrloer = TextEditingController();
  TextEditingController passowrdContrloer = TextEditingController();
  TextEditingController emailContrloer = TextEditingController();
  TextEditingController confirm_passowrdContrloer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, 
      body: Center(
        child: Column(
          
        
          children: [
            Gap(100) ,  
        
            CustemText(text: "Welcom To Rahla App" , 
            color: Colors.white, 
            size: 25, 
            weight: FontWeight.bold,
            ) ,  
      
            Gap(100) ,  
      
            
      
            Expanded(
              child: Container(
                width: double.infinity, 
                decoration: BoxDecoration(
                  color: Colors.white , 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12) , 
                    topRight: Radius.circular(12) , 
                  ) ,  
                  
                ), 

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Gap(50) , 
                      // emile and passowed
                      CustemTextFiled(
                        hintText: 'Emaile ',
                       controller:NameContrloer ,
                      ) ,  

                      Gap(20) , 

                       CustemTextFiled(
                        hintText: 'Pasword',
                       controller:passowrdContrloer ,
                      ) ,  

                      Gap(20) ,

                      CustemBatton(
                        
                        text: "Singin"
                      
                        ) , 

                    ],
                  ),
                ),
              ),
            )
        
          ],
        ),
      ),
    ); 
  }
}