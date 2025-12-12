// نموذج بيانات المستخدم - يحتوي على جميع معلومات الملف الشخصي
class UserProfile {
  final String name; // اسم المستخدم الكامل
  final String email; // البريد الإلكتروني
  final String phone; // رقم الهاتف
  final String avatarUrl; // رابط الصورة الشخصية (يمكن أن يكون فارغاً)
  final int totalTrips; // إجمالي عدد الرحلات المكتملة
  final int points; // النقاط المكتسبة من الحجوزات
  final int totalBookings; // إجمالي عدد الحجوزات

  // Constructor للنموذج
  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl = '', // القيمة الافتراضية فارغة
    this.totalTrips = 0,
    this.points = 0,
    this.totalBookings = 0,
  });

  // دالة لتحويل النموذج إلى Map (مفيدة للتخزين أو الإرسال)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'avatarUrl': avatarUrl,
      'totalTrips': totalTrips,
      'points': points,
      'totalBookings': totalBookings,
    };
  }

  // دالة لإنشاء نموذج من Map (مفيدة عند استرجاع البيانات)
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      avatarUrl: json['avatarUrl'] as String? ?? '',
      totalTrips: json['totalTrips'] as int? ?? 0,
      points: json['points'] as int? ?? 0,
      totalBookings: json['totalBookings'] as int? ?? 0,
    );
  }

  // دالة لنسخ النموذج مع تعديل بعض القيم
  UserProfile copyWith({
    String? name,
    String? email,
    String? phone,
    String? avatarUrl,
    int? totalTrips,
    int? points,
    int? totalBookings,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      totalTrips: totalTrips ?? this.totalTrips,
      points: points ?? this.points,
      totalBookings: totalBookings ?? this.totalBookings,
    );
  }
}
