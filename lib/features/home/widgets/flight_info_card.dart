import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/features/home/widgets/info_row.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class FlightInfoCard extends StatelessWidget {
  final String airline;
  final String flightNumber;
  final String flightDuration;

  const FlightInfoCard({
    super.key,
    required this.airline,
    required this.flightNumber,
    required this.flightDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustemText(
            text: 'معلومات الرحلة',
            size: 20,
            weight: FontWeight.bold,
            color: Colors.black87,
          ),
          const Gap(16),
          InfoRow(icon: Icons.airlines, label: 'شركة الطيران', value: airline),
          const Gap(12),
          InfoRow(
            icon: Icons.confirmation_number,
            label: 'رقم الرحلة',
            value: flightNumber,
          ),
          const Gap(12),
          InfoRow(
            icon: Icons.schedule,
            label: 'مدة الرحلة',
            value: flightDuration,
          ),
        ],
      ),
    );
  }
}
