import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/core/utils/go_router.dart';
import 'package:user_inter_face_2/features/auth/data/user_data.dart';
import 'package:user_inter_face_2/features/auth/widgets/profile_header_widget.dart';
import 'package:user_inter_face_2/features/auth/widgets/profile_menu_item_widget.dart';
import 'package:user_inter_face_2/features/auth/widgets/profile_stats_widget.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

// صفحة الملف الشخصي - تعرض معلومات المستخدم والإعدادات
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على بيانات المستخدم الحالي
    final user = UserData.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              // رأس الصفحة مع الصورة الشخصية والمعلومات الأساسية
              ProfileHeaderWidget(user: user),

              // إحصائيات المستخدم (الرحلات، النقاط، الحجوزات)
              ProfileStatsWidget(user: user),

              // قسم الإعدادات
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان قسم الإعدادات
                    const CustemText(
                      text: 'الإعدادات',
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.black87,
                    ),

                    const Gap(16),

                    // عنصر معلومات الحساب
                    ProfileMenuItemWidget(
                      icon: Icons.person_outline,
                      title: 'معلومات الحساب',
                      onTap: () {
                        _showSnackBar(context, 'معلومات الحساب');
                      },
                    ),

                    // عنصر الإشعارات
                    ProfileMenuItemWidget(
                      icon: Icons.notifications_outlined,
                      title: 'الإشعارات',
                      iconColor: Colors.orange.shade700,
                      backgroundColor: Colors.orange.shade50,
                      onTap: () {
                        _showSnackBar(context, 'الإشعارات');
                      },
                    ),

                    // عنصر اللغة
                    ProfileMenuItemWidget(
                      icon: Icons.language,
                      title: 'اللغة',
                      iconColor: Colors.green.shade700,
                      backgroundColor: Colors.green.shade50,
                      onTap: () {
                        _showSnackBar(context, 'اللغة');
                      },
                    ),

                    // عنصر المساعدة والدعم
                    ProfileMenuItemWidget(
                      icon: Icons.help_outline,
                      title: 'المساعدة والدعم',
                      iconColor: Colors.purple.shade700,
                      backgroundColor: Colors.purple.shade50,
                      onTap: () {
                        _showSnackBar(context, 'المساعدة والدعم');
                      },
                    ),

                    // عنصر الشروط والأحكام
                    ProfileMenuItemWidget(
                      icon: Icons.description_outlined,
                      title: 'الشروط والأحكام',
                      iconColor: Colors.blue.shade700,
                      backgroundColor: Colors.blue.shade50,
                      onTap: () {
                        _showSnackBar(context, 'الشروط والأحكام');
                      },
                    ),

                    // عنصر سياسة الخصوصية
                    ProfileMenuItemWidget(
                      icon: Icons.privacy_tip_outlined,
                      title: 'سياسة الخصوصية',
                      iconColor: Colors.teal.shade700,
                      backgroundColor: Colors.teal.shade50,
                      onTap: () {
                        _showSnackBar(context, 'سياسة الخصوصية');
                      },
                    ),

                    const Gap(24),

                    // زر تسجيل الخروج
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showLogoutDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade50,
                          foregroundColor: Colors.red.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                          side: BorderSide(
                            color: Colors.red.shade200,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              size: 22,
                              color: Colors.red.shade700,
                            ),
                            const Gap(8),
                            CustemText(
                              text: 'تسجيل الخروج',
                              size: 16,
                              weight: FontWeight.bold,
                              color: Colors.red.shade700,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Gap(24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة مساعدة لإظهار SnackBar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustemText(text: message, color: Colors.white),
        backgroundColor: AppColors.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // دالة لإظهار نافذة تأكيد تسجيل الخروج
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const CustemText(
            text: 'تسجيل الخروج',
            size: 20,
            weight: FontWeight.bold,
            color: Colors.black87,
          ),
          content: const CustemText(
            text: 'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
            size: 16,
            color: Colors.black54,
          ),
          actions: [
            // زر الإلغاء
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق النافذة
              },
              child: CustemText(
                text: 'إلغاء',
                color: Colors.grey.shade600,
                weight: FontWeight.w600,
              ),
            ),
            // زر التأكيد
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق النافذة
                // الانتقال لصفحة تسجيل الدخول
                context.go(AppRouter.login);
              },
              child: const CustemText(
                text: 'تسجيل الخروج',
                color: Colors.red,
                weight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
