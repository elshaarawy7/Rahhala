// استيراد المكتبات الأساسية لبناء واجهة المستخدم
import 'package:flutter/material.dart';
import 'package:gap/gap.dart'; // لإضافة مسافات بين العناصر
import 'package:go_router/go_router.dart'; // للتنقل بين الصفحات
import 'package:user_inter_face_2/core/constants/app_colos.dart'; // الألوان المستخدمة في التطبيق
import 'package:user_inter_face_2/core/utils/go_router.dart'; // مسارات التطبيق
import 'package:user_inter_face_2/features/home/data/destination_model.dart'; // نموذج بيانات الوجهة
import 'package:user_inter_face_2/features/payment/data/payment_method_model.dart'; // نموذج بيانات طريقة الدفع
import 'package:user_inter_face_2/features/payment/widgets/payment_success_widget.dart'; // widget رسالة النجاح
import 'package:user_inter_face_2/features/shared/custem_text.dart'; // widget النص المخصص

// صفحة تأكيد الدفع - تظهر بعد نجاح عملية الدفع
class PaymentConfirmationPage extends StatelessWidget {
  final Destination destination; // معلومات الوجهة المحجوزة
  final PaymentMethod paymentMethod; // طريقة الدفع المستخدمة
  final String cardNumber; // رقم البطاقة المستخدمة

  const PaymentConfirmationPage({
    super.key,
    required this.destination,
    required this.paymentMethod,
    required this.cardNumber,
  });

  // دالة لتوليد رقم حجز فريد باستخدام الوقت الحالي
  String _generateBookingReference() {
    final timestamp =
        DateTime.now().millisecondsSinceEpoch; // الحصول على الوقت بالميلي ثانية
    // أخذ آخر 8 أرقام من الوقت وإضافة BK في البداية
    return 'BK${timestamp.toString().substring(timestamp.toString().length - 8)}';
  }

  // دالة لإخفاء رقم البطاقة وإظهار آخر 4 أرقام فقط للأمان
  String _getMaskedCardNumber() {
    if (cardNumber.length < 4) return '****'; // إذا كان الرقم قصير جداً
    final cleaned = cardNumber.replaceAll(' ', ''); // إزالة المسافات
    // إرجاع الرقم مخفي مع آخر 4 أرقام
    return '**** **** **** ${cleaned.substring(cleaned.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    // توليد رقم الحجز عند بناء الصفحة
    final bookingRef = _generateBookingReference();

    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء نظيفة
      body: SafeArea(
        // SafeArea لتجنب تداخل المحتوى مع شريط الحالة
        child: Padding(
          padding: const EdgeInsets.all(24), // مسافة من جميع الجوانب
          child: Column(
            children: [
              // المحتوى الرئيسي - قابل للتمرير
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(40), // مسافة من الأعلى
                      // Widget النجاح مع الرسائل والأيقونات
                      PaymentSuccessWidget(
                        bookingReference: bookingRef, // تمرير رقم الحجز
                        cityName: destination.cityName, // تمرير اسم المدينة
                      ),

                      const Gap(40), // مسافة قبل التفاصيل
                      // بطاقة تفاصيل الحجز
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50, // خلفية رمادية فاتحة
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // زوايا دائرية
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ), // حدود رمادية
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // عنوان القسم
                            const CustemText(
                              text: 'تفاصيل الحجز',
                              size: 16,
                              weight: FontWeight.bold,
                              color: Colors.black87,
                            ),

                            const Gap(16),

                            // صف تفاصيل الوجهة
                            _buildDetailRow(
                              'الوجهة', // العنوان
                              '${destination.cityName}, ${destination.countryName}', // القيمة
                              Icons.location_on_outlined, // الأيقونة
                            ),

                            const Gap(12),

                            // صف تفاصيل شركة الطيران
                            _buildDetailRow(
                              'شركة الطيران',
                              destination.airline,
                              Icons.flight,
                            ),

                            const Gap(12),

                            // صف رقم الرحلة
                            _buildDetailRow(
                              'رقم الرحلة',
                              destination.flightNumber,
                              Icons.confirmation_number_outlined,
                            ),

                            const Gap(12),

                            // صف وقت الإقلاع
                            _buildDetailRow(
                              'وقت الإقلاع',
                              destination.departureTime,
                              Icons.access_time,
                            ),

                            const Gap(12),

                            // صف المبلغ المدفوع (السعر + الضريبة 14% + رسوم الخدمة 50)
                            _buildDetailRow(
                              'المبلغ المدفوع',
                              '${(destination.ticketPrice * 1.14 + 50).toStringAsFixed(2)} ${destination.currency}',
                              Icons.payments_outlined,
                            ),

                            const Gap(12),

                            // صف طريقة الدفع مع رقم البطاقة المخفي
                            _buildDetailRow(
                              'طريقة الدفع',
                              '${paymentMethod.nameAr} ${_getMaskedCardNumber()}',
                              paymentMethod.icon,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(20),

              // قسم أزرار الإجراءات في الأسفل
              Column(
                children: [
                  // زر العودة للصفحة الرئيسية
                  ElevatedButton(
                    onPressed: () {
                      // الانتقال للصفحة الرئيسية واستبدال الصفحة الحالية
                      context.go(AppRouter.home);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor, // لون الخلفية
                      foregroundColor: Colors.white, // لون النص والأيقونة
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ), // مسافة داخلية
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // زوايا دائرية
                      ),
                      elevation: 0, // بدون ظل
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ), // عرض كامل وارتفاع 50
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_outlined, size: 24), // أيقونة المنزل
                        Gap(8),
                        CustemText(
                          text: 'العودة للرئيسية',
                          size: 16,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  const Gap(12),

                  // زر تحميل التذكرة (Outlined Button)
                  OutlinedButton(
                    onPressed: () {
                      // إظهار رسالة تأكيد للمستخدم
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const CustemText(
                            text: 'جاري تحميل التذكرة...',
                            color: Colors.white,
                          ),
                          backgroundColor: AppColors.primaryColor,
                          behavior: SnackBarBehavior.floating, // SnackBar عائم
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor, // لون النص
                      side: const BorderSide(
                        color: AppColors.primaryColor, // لون الحدود
                        width: 2, // سمك الحدود
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.download_outlined,
                          size: 24,
                        ), // أيقونة التحميل
                        Gap(8),
                        CustemText(
                          text: 'تحميل التذكرة',
                          size: 16,
                          weight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة مساعدة لبناء صف تفاصيل واحد (يحتوي على أيقونة وعنوان وقيمة)
  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Row(
      children: [
        // الأيقونة
        Icon(icon, size: 20, color: AppColors.primaryColor),
        const Gap(12),
        // العنوان والقيمة
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان (label) بلون رمادي فاتح
              CustemText(text: label, size: 12, color: Colors.grey.shade600),
              const Gap(4),
              // القيمة (value) بخط أكبر وأغمق
              CustemText(
                text: value,
                size: 14,
                weight: FontWeight.w600,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
