import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/features/auth/data/user_profile_model.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

// Widget لعرض إحصائيات المستخدم (الرحلات، النقاط، الحجوزات)
class ProfileStatsWidget extends StatelessWidget {
  final UserProfile user; // بيانات المستخدم

  const ProfileStatsWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // إحصائية الرحلات
          _buildStatItem(
            icon: Icons.flight_takeoff,
            value: user.totalTrips.toString(),
            label: 'رحلة',
            color: Colors.blue.shade600,
          ),

          // خط فاصل عمودي
          Container(height: 50, width: 1, color: Colors.grey.shade300),

          // إحصائية النقاط
          _buildStatItem(
            icon: Icons.stars,
            value: user.points.toString(),
            label: 'نقطة',
            color: Colors.amber.shade700,
          ),

          // خط فاصل عمودي
          Container(height: 50, width: 1, color: Colors.grey.shade300),

          // إحصائية الحجوزات
          _buildStatItem(
            icon: Icons.confirmation_number,
            value: user.totalBookings.toString(),
            label: 'حجز',
            color: Colors.green.shade600,
          ),
        ],
      ),
    );
  }

  // Widget لبناء عنصر إحصائية واحد
  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        // أيقونة مع خلفية دائرية ملونة
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),

        const Gap(8),

        // القيمة (الرقم)
        CustemText(
          text: value,
          size: 20,
          weight: FontWeight.bold,
          color: Colors.black87,
        ),

        const Gap(4),

        // العنوان (التسمية)
        CustemText(text: label, size: 12, color: Colors.grey.shade600),
      ],
    );
  }
}
