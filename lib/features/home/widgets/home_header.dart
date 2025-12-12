import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustemText(
            text: 'مرحباً بك في رحالة',
            size: 28,
            weight: FontWeight.bold,
            color: Colors.black87,
          ),
          const Gap(8),
          CustemText(
            text: 'اكتشف وجهتك القادمة',
            size: 16,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
