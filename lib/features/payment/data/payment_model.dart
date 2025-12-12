import 'package:user_inter_face_2/features/home/data/destination_model.dart';
import 'package:user_inter_face_2/features/payment/data/payment_method_model.dart';

enum PaymentStatus { pending, processing, completed, failed }

class Payment {
  final String id;
  final Destination destination;
  final PaymentMethod paymentMethod;
  final double totalAmount;
  final double taxAmount;
  final double serviceFee;
  final PaymentStatus status;
  final DateTime createdAt;

  // بيانات البطاقة (للعرض فقط - مش للتخزين الحقيقي)
  final String? cardHolderName;
  final String? cardNumber;
  final String? expiryDate;
  final String? cvv;

  Payment({
    required this.id,
    required this.destination,
    required this.paymentMethod,
    required this.totalAmount,
    this.taxAmount = 0.0,
    this.serviceFee = 0.0,
    this.status = PaymentStatus.pending,
    DateTime? createdAt,
    this.cardHolderName,
    this.cardNumber,
    this.expiryDate,
    this.cvv,
  }) : createdAt = createdAt ?? DateTime.now();

  // حساب الإجمالي الكلي
  double get grandTotal => totalAmount + taxAmount + serviceFee;

  // نسخة من الـ Payment مع تحديث بعض القيم
  Payment copyWith({
    String? id,
    Destination? destination,
    PaymentMethod? paymentMethod,
    double? totalAmount,
    double? taxAmount,
    double? serviceFee,
    PaymentStatus? status,
    DateTime? createdAt,
    String? cardHolderName,
    String? cardNumber,
    String? expiryDate,
    String? cvv,
  }) {
    return Payment(
      id: id ?? this.id,
      destination: destination ?? this.destination,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      totalAmount: totalAmount ?? this.totalAmount,
      taxAmount: taxAmount ?? this.taxAmount,
      serviceFee: serviceFee ?? this.serviceFee,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
    );
  }

  // إخفاء رقم البطاقة (عرض آخر 4 أرقام فقط)
  String get maskedCardNumber {
    if (cardNumber == null || cardNumber!.length < 4) return '****';
    return '**** **** **** ${cardNumber!.substring(cardNumber!.length - 4)}';
  }
}
