import 'package:flutter/material.dart';

enum PaymentMethodType { creditCard, paypal, applePay, googlePay }

class PaymentMethod {
  final String id;
  final String name;
  final String nameAr;
  final PaymentMethodType type;
  final IconData icon;
  final bool isAvailable;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.type,
    required this.icon,
    this.isAvailable = true,
  });

  // قائمة طرق الدفع المتاحة
  static List<PaymentMethod> getAvailableMethods() {
    return [
      PaymentMethod(
        id: 'credit_card',
        name: 'Credit Card',
        nameAr: 'بطاقة ائتمان',
        type: PaymentMethodType.creditCard,
        icon: Icons.credit_card,
        isAvailable: true,
      ),
      PaymentMethod(
        id: 'paypal',
        name: 'PayPal',
        nameAr: 'باي بال',
        type: PaymentMethodType.paypal,
        icon: Icons.account_balance_wallet,
        isAvailable: true,
      ),
      PaymentMethod(
        id: 'apple_pay',
        name: 'Apple Pay',
        nameAr: 'آبل باي',
        type: PaymentMethodType.applePay,
        icon: Icons.apple,
        isAvailable: true,
      ),
      PaymentMethod(
        id: 'google_pay',
        name: 'Google Pay',
        nameAr: 'جوجل باي',
        type: PaymentMethodType.googlePay,
        icon: Icons.g_mobiledata,
        isAvailable: true,
      ),
    ];
  }
}
