// استيراد المكتبات الأساسية
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';
import 'package:user_inter_face_2/features/shared/custem_text.dart';

// Widget لعرض رسالة نجاح الدفع مع تأثيرات حركية جميلة
class PaymentSuccessWidget extends StatefulWidget {
  final String bookingReference; // رقم الحجز المرجعي
  final String cityName; // اسم المدينة المقصودة

  const PaymentSuccessWidget({
    super.key,
    required this.bookingReference,
    required this.cityName,
  });

  @override
  State<PaymentSuccessWidget> createState() => _PaymentSuccessWidgetState();
}

class _PaymentSuccessWidgetState extends State<PaymentSuccessWidget>
    with SingleTickerProviderStateMixin {
  // متحكم الحركة الرئيسي
  late AnimationController _controller;

  // حركة التكبير للأيقونة
  late Animation<double> _scaleAnimation;

  // حركة الظهور التدريجي للنصوص
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // إنشاء متحكم الحركة بمدة 800 ميلي ثانية
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // تعريف حركة التكبير بمنحنى مرن (elasticOut) لتأثير ارتداد جميل
    _scaleAnimation =
        Tween<double>(
          begin: 0.0, // البداية من حجم صفر
          end: 1.0, // النهاية بالحجم الطبيعي
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.elasticOut, // منحنى مرن للحركة
          ),
        );

    // تعريف حركة الظهور التدريجي تبدأ بعد 30% من وقت الحركة
    _fadeAnimation =
        Tween<double>(
          begin: 0.0, // البداية شفاف تماماً
          end: 1.0, // النهاية ظاهر تماماً
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.3,
              1.0,
              curve: Curves.easeIn,
            ), // تبدأ بعد 30% من الوقت
          ),
        );

    // بدء تشغيل الحركة
    _controller.forward();
  }

  @override
  void dispose() {
    // تنظيف الموارد عند إزالة الـ Widget
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // أيقونة النجاح المتحركة مع تأثير التكبير
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              // خلفية خضراء فاتحة
              color: Colors.green.shade50,
              shape: BoxShape.circle, // شكل دائري
              // إضافة ظل جميل للدائرة
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.check_circle, // أيقونة علامة الصح
              size: 80,
              color: Colors.green.shade500,
            ),
          ),
        ),

        const Gap(32),

        // رسالة النجاح مع تأثير الظهور التدريجي
        FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              // العنوان الرئيسي
              const CustemText(
                text: '🎉 تم الدفع بنجاح! 🎉',
                size: 28,
                weight: FontWeight.bold,
                color: Colors.black87,
              ),

              const Gap(12),

              // رسالة تأكيد الحجز
              CustemText(
                text: 'تم حجز رحلتك إلى ${widget.cityName} بنجاح',
                size: 16,
                color: Colors.grey.shade600,
              ),

              const Gap(8),

              // رسالة ترحيبية
              CustemText(
                text: 'نتمنى لك رحلة سعيدة وممتعة ✈️',
                size: 14,
                color: Colors.grey.shade500,
              ),

              const Gap(32),

              // بطاقة رقم الحجز مع تصميم جذاب
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  // خلفية بلون أساسي فاتح
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    width: 2,
                  ),
                  // إضافة ظل خفيف
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // عنوان رقم الحجز
                    CustemText(
                      text: 'رقم الحجز المرجعي',
                      size: 13,
                      color: Colors.grey.shade600,
                    ),
                    const Gap(8),
                    // رقم الحجز نفسه
                    CustemText(
                      text: widget.bookingReference,
                      size: 20,
                      weight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),

              const Gap(24),

              // بطاقة معلومات البريد الإلكتروني
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    // أيقونة المعلومات
                    Icon(
                      Icons.email_outlined,
                      color: Colors.blue.shade700,
                      size: 24,
                    ),
                    const Gap(12),
                    // نص المعلومات
                    Expanded(
                      child: CustemText(
                        text: 'تم إرسال تفاصيل الحجز إلى بريدك الإلكتروني',
                        size: 13,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(16),

              // بطاقة نصيحة للمسافر
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade100),
                ),
                child: Row(
                  children: [
                    // أيقونة النصيحة
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.amber.shade700,
                      size: 24,
                    ),
                    const Gap(12),
                    // نص النصيحة
                    Expanded(
                      child: CustemText(
                        text: 'احتفظ برقم الحجز للرجوع إليه عند الحاجة',
                        size: 13,
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(16),

              // رسالة شكر نهائية
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor.withOpacity(0.1),
                      AppColors.primaryColor.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // أيقونة القلب
                    Icon(Icons.favorite, color: Colors.red.shade400, size: 20),
                    const Gap(8),
                    // رسالة الشكر
                    CustemText(
                      text: 'شكراً لاختيارك خدماتنا',
                      size: 14,
                      weight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
