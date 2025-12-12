import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/home/data/destination_model.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class PaymentSummaryCard extends StatelessWidget {
  final Destination destination;
  final double taxAmount;
  final double serviceFee;

  const PaymentSummaryCard({
    super.key,
    required this.destination,
    this.taxAmount = 0.0,
    this.serviceFee = 0.0,
  });

  double get totalAmount => destination.ticketPrice + taxAmount + serviceFee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          const CustemText(
            text: 'ملخص الحجز',
            size: 18,
            weight: FontWeight.bold,
            color: Colors.black87,
          ),

          const Gap(16),

          // معلومات الوجهة
          Row(
            children: [
              // صورة الوجهة
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  destination.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.image, color: Colors.grey),
                    );
                  },
                ),
              ),

              const Gap(12),

              // تفاصيل الوجهة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustemText(
                      text: destination.cityName,
                      size: 16,
                      weight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    const Gap(4),
                    CustemText(
                      text: destination.countryName,
                      size: 13,
                      color: Colors.grey.shade600,
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Icon(
                          Icons.flight,
                          size: 14,
                          color: AppColors.primaryColor,
                        ),
                        const Gap(4),
                        CustemText(
                          text: destination.airline,
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Gap(20),

          // خط فاصل
          Divider(color: Colors.grey.shade200, thickness: 1),

          const Gap(16),

          // تفاصيل السعر
          _buildPriceRow(
            'سعر التذكرة',
            destination.ticketPrice,
            destination.currency,
          ),

          if (taxAmount > 0) ...[
            const Gap(12),
            _buildPriceRow(
              'الضرائب',
              taxAmount,
              destination.currency,
              isSubItem: true,
            ),
          ],

          if (serviceFee > 0) ...[
            const Gap(12),
            _buildPriceRow(
              'رسوم الخدمة',
              serviceFee,
              destination.currency,
              isSubItem: true,
            ),
          ],

          const Gap(16),

          // خط فاصل
          Divider(color: Colors.grey.shade200, thickness: 1),

          const Gap(16),

          // الإجمالي
          _buildPriceRow(
            'الإجمالي',
            totalAmount,
            destination.currency,
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    double amount,
    String currency, {
    bool isSubItem = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustemText(
          text: label,
          size: isTotal ? 16 : 14,
          weight: isTotal ? FontWeight.bold : FontWeight.normal,
          color: isSubItem ? Colors.grey.shade600 : Colors.black87,
        ),
        CustemText(
          text: '${amount.toStringAsFixed(2)} $currency',
          size: isTotal ? 18 : 14,
          weight: isTotal ? FontWeight.bold : FontWeight.w600,
          color: isTotal ? AppColors.primaryColor : Colors.black87,
        ),
      ],
    );
  }
}
