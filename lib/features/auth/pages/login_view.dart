import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_batton.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';
import 'package:user_inter_face_2/features/shared/custem_text_filed.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Gap(100),
                CustemText(
                  text: "Welcome Back",
                  color: Colors.white,
                  size: 25,
                  weight: FontWeight.bold,
                ),
                Gap(100),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Gap(50),
                    CustemTextFiled(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    Gap(20),
                    CustemTextFiled(
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    Gap(50),
                    CustemBatton(text: "Login"),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push('/signIn');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
