import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class FlightTimeline extends StatelessWidget {
  final String departureAirport;
  final String departureTime;
  final String arrivalAirport;
  final String arrivalTime;
  final String flightDuration;

  const FlightTimeline({
    super.key,
    required this.departureAirport,
    required this.departureTime,
    required this.arrivalAirport,
    required this.arrivalTime,
    required this.flightDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Departure
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustemText(
                      text: departureAirport,
                      size: 24,
                      weight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    const Gap(4),
                    const CustemText(
                      text: 'الإقلاع',
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustemText(
                  text: departureTime,
                  size: 16,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),

          const Gap(16),

          // Flight Path Indicator
          Row(
            children: [
              const Gap(12),
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 40,
                    color: AppColors.primaryColor.withOpacity(0.3),
                  ),
                  Icon(Icons.flight, color: AppColors.primaryColor, size: 24),
                  Container(
                    width: 2,
                    height: 40,
                    color: AppColors.primaryColor.withOpacity(0.3),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: Center(
                  child: CustemText(
                    text: flightDuration,
                    size: 14,
                    color: Colors.grey[600],
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const Gap(16),

          // Arrival
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustemText(
                      text: arrivalAirport,
                      size: 24,
                      weight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    const Gap(4),
                    const CustemText(
                      text: 'الوصول',
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustemText(
                  text: arrivalTime,
                  size: 16,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
