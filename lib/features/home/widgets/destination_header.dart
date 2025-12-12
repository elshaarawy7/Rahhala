import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class DestinationHeader extends StatelessWidget {
  final String cityName;
  final String countryName;
  final String description;

  const DestinationHeader({
    super.key,
    required this.cityName,
    required this.countryName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustemText(
          text: cityName,
          size: 32,
          weight: FontWeight.bold,
          color: Colors.black87,
        ),
        const Gap(8),
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.primaryColor, size: 20),
            const Gap(4),
            CustemText(text: countryName, size: 18, color: Colors.grey[600]),
          ],
        ),
        const Gap(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustemText(
            text: description,
            size: 14,
            color: AppColors.primaryColor,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
