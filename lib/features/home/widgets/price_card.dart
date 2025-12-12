import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class PriceCard extends StatelessWidget {
  final double ticketPrice;
  final String currency;

  const PriceCard({
    super.key,
    required this.ticketPrice,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustemText(
                text: 'سعر التذكرة',
                size: 14,
                color: Colors.white70,
              ),
              const Gap(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustemText(
                    text: ticketPrice.toStringAsFixed(0),
                    size: 36,
                    weight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  const Gap(8),

                  // العمله
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CustemText(
                      text: currency,
                      size: 18,
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.flight_takeoff,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
