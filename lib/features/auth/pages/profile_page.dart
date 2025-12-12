import 'package:flutter/material.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustemText(text: 'Profile Page'),
      ),
    );
  }
}