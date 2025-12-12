import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/auth/data/user_profile_model.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

// Widget رأس صفحة البروفايل - يعرض الصورة الشخصية ومعلومات المستخدم
class ProfileHeaderWidget extends StatelessWidget {
  final UserProfile user; // بيانات المستخدم

  const ProfileHeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // تدرج لوني جميل من الأزرق الداكن للأزرق الفاتح
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.7),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        // ظل خفيف للعمق
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // الصورة الشخصية مع زر التعديل
          Stack(
            children: [
              // الصورة الشخصية الدائرية
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: 
                       Image.asset(
                          "assets/540776597_1134288905261735_5497583683761795195_n.jpg",
                          fit: BoxFit.cover,
                         
                        )
                       // أيقونة افتراضية إذا لم يكن هناك رابط
                ),
              ),
              // زر التعديل في الزاوية السفلية اليمنى
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.camera_alt,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    onPressed: () {
                      // TODO: إضافة وظيفة تغيير الصورة
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: CustemText(
                            text: 'ميزة تغيير الصورة قريباً',
                            color: Colors.white,
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          const Gap(20),

          // اسم المستخدم
          CustemText(
            text: user.name,
            size: 24,
            weight: FontWeight.bold,
            color: Colors.white,
          ),

          const Gap(8),

          // البريد الإلكتروني
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email_outlined, color: Colors.white70, size: 16),
              const Gap(6),
              CustemText(text: user.email, size: 14, color: Colors.white70),
            ],
          ),

          const Gap(6),

          // رقم الهاتف
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone_outlined, color: Colors.white70, size: 16),
              const Gap(6),
              CustemText(text: user.phone, size: 14, color: Colors.white70),
            ],
          ),
        ],
      ),
    );
  }

  // Widget للأيقونة الافتراضية عندما لا توجد صورة
  Widget _buildDefaultAvatar() {
    return Container(
      color: Colors.white,
      child: Icon(Icons.person, size: 60, color: AppColors.primaryColor),
    );
  }
}
