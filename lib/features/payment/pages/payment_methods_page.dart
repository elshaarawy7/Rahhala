import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/core/utils/go_router.dart';
import 'package:user_inter_face_2/features/home/data/destination_model.dart';
import 'package:user_inter_face_2/features/payment/data/payment_method_model.dart';
import 'package:user_inter_face_2/features/payment/widgets/payment_method_card.dart';
import 'package:user_inter_face_2/features/payment/widgets/payment_summary_card.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class PaymentMethodsPage extends StatefulWidget {
  final Destination destination;

  const PaymentMethodsPage({super.key, required this.destination});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  PaymentMethod? _selectedPaymentMethod;
  final List<PaymentMethod> _paymentMethods =
      PaymentMethod.getAvailableMethods();

  void _continueToPayment() {
    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const CustemText(
            text: 'من فضلك اختر طريقة الدفع',
            color: Colors.white,
          ),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    // الانتقال لصفحة تفاصيل الدفع
    context.push(
      AppRouter.payment_details,
      extra: {
        'destination': widget.destination,
        'paymentMethod': _selectedPaymentMethod,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const CustemText(
          text: 'طريقة الدفع',
          size: 20,
          weight: FontWeight.bold,
          color: Colors.black87,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // المحتوى الرئيسي
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ملخص الحجز
                  PaymentSummaryCard(
                    destination: widget.destination,
                    taxAmount:
                        widget.destination.ticketPrice * 0.14, // 14% ضريبة
                    serviceFee: 50, // رسوم خدمة ثابتة
                  ),

                  const Gap(32),

                  // عنوان طرق الدفع
                  const CustemText(
                    text: 'اختر طريقة الدفع',
                    size: 18,
                    weight: FontWeight.bold,
                    color: Colors.black87,
                  ),

                  const Gap(16),

                  // قائمة طرق الدفع
                  ...List.generate(_paymentMethods.length, (index) {
                    final method = _paymentMethods[index];
                    return PaymentMethodCard(
                      paymentMethod: method,
                      isSelected: _selectedPaymentMethod?.id == method.id,
                      onTap: () {
                        setState(() {
                          _selectedPaymentMethod = method;
                        });
                      },
                    );
                  }),

                  const Gap(100), // مساحة للزر
                ],
              ),
            ),
          ),

          // زر المتابعة
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: _continueToPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustemText(
                      text: 'متابعة',
                      size: 18,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Gap(8),
                    Icon(Icons.arrow_forward, size: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
