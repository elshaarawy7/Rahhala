import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

// Widget قابل لإعادة الاستخدام لعناصر قائمة الإعدادات
class ProfileMenuItemWidget extends StatelessWidget {
  final IconData icon; // الأيقونة
  final String title; // العنوان
  final VoidCallback onTap; // الإجراء عند الضغط
  final Color? iconColor; // لون الأيقونة (اختياري)
  final Color? backgroundColor; // لون خلفية الأيقونة (اختياري)

  const ProfileMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                // الأيقونة مع خلفية دائرية
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color:
                        backgroundColor ??
                        AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? AppColors.primaryColor,
                    size: 22,
                  ),
                ),

                const Gap(16),

                // العنوان
                Expanded(
                  child: CustemText(
                    text: title,
                    size: 16,
                    weight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                // سهم التنقل
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
