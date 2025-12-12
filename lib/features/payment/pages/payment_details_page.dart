import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/core/utils/go_router.dart';
import 'package:user_inter_face_2/features/home/data/destination_model.dart';
import 'package:user_inter_face_2/features/payment/data/payment_method_model.dart';
import 'package:user_inter_face_2/features/payment/widgets/credit_card_form.dart';
import 'package:user_inter_face_2/features/payment/widgets/payment_summary_card.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

class PaymentDetailsPage extends StatefulWidget {
  final Destination destination;
  final PaymentMethod paymentMethod;

  const PaymentDetailsPage({
    super.key,
    required this.destination,
    required this.paymentMethod,
  });

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final GlobalKey<CreditCardFormState> _formKey =
      GlobalKey<CreditCardFormState>();
  bool _isProcessing = false;

  void _processPayment(
    String cardNumber,
    String cardHolder,
    String expiryDate,
    String cvv,
  ) async {
    setState(() {
      _isProcessing = true;
    });

    // محاكاة معالجة الدفع
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isProcessing = false;
    });

    // الانتقال لصفحة التأكيد
    context.pushReplacement(
      AppRouter.payment_confirmation,
      extra: {
        'destination': widget.destination,
        'paymentMethod': widget.paymentMethod,
        'cardNumber': cardNumber,
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
          text: 'تفاصيل الدفع',
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
                  // طريقة الدفع المختارة
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          widget.paymentMethod.icon,
                          color: AppColors.primaryColor,
                          size: 28,
                        ),
                        const Gap(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustemText(
                              text: 'طريقة الدفع',
                              size: 12,
                              color: Colors.grey,
                            ),
                            const Gap(4),
                            CustemText(
                              text: widget.paymentMethod.nameAr,
                              size: 16,
                              weight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Gap(24),

                  // فورم بيانات البطاقة
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
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
                        const CustemText(
                          text: 'بيانات البطاقة',
                          size: 18,
                          weight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        const Gap(20),
                        CreditCardForm(
                          key: _formKey,
                          onSubmit: _processPayment,
                        ),
                      ],
                    ),
                  ),

                  const Gap(24),

                  // ملخص الدفع
                  PaymentSummaryCard(
                    destination: widget.destination,
                    taxAmount: widget.destination.ticketPrice * 0.14,
                    serviceFee: 50,
                  ),

                  const Gap(100), // مساحة للزر
                ],
              ),
            ),
          ),

          // زر الدفع
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
                onPressed: _isProcessing
                    ? null
                    : () {
                        // استدعاء submit من الـ CreditCardForm
                        _formKey.currentState?.submit();
                      },

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  disabledBackgroundColor: Colors.grey.shade300,
                ),
                child: _isProcessing
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.lock_outline, size: 24),
                          const Gap(8),
                          CustemText(
                            text:
                                'ادفع الآن ${(widget.destination.ticketPrice * 1.14 + 50).toStringAsFixed(2)} ${widget.destination.currency}',
                            size: 16,
                            weight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
