import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/core/utils/go_router.dart';
import 'package:user_inter_face_2/features/auth/widgets/item_scoil.dart';
import 'package:user_inter_face_2/features/shared/custem_batton.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';
import 'package:user_inter_face_2/features/shared/custem_text_filed.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Form(
        key: formKey,
        child: CustomScrollView(
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
                      CustemBatton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.go(AppRouter.home);
                          }
                        },
                        text: "Login",
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustemText(
                            text: "Don't have an account?",
                            color: Colors.black,
                            size: 17,
                            weight: FontWeight.normal,
                          ),
                          TextButton(
                            onPressed: () {
                              context.go(AppRouter.signIn);
                            },
                            child: CustemText(
                              text: "Sign Up",
                              color: AppColors.primaryColor,
                              size: 20,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemScoil(image: 'assets/schoil/apple.png'),
                          Gap(10),
                          ItemScoil(image: 'assets/schoil/Facebook.png'),
                          Gap(10),
                          ItemScoil(image: 'assets/schoil/Google.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
