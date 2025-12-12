import 'user_profile_model.dart';

// بيانات المستخدم التجريبية - يمكن استبدالها ببيانات حقيقية من API أو قاعدة بيانات
class UserData {
  // المستخدم الحالي (بيانات تجريبية)
  static const UserProfile currentUser = UserProfile(
    name: "الشعراوي حسن ", // اسم المستخدم
    email: 'elshaarawy@gmail.com', // البريد الإلكتروني
    phone: '+20 123 456 7890', // رقم الهاتف
    avatarUrl: '', // سيتم استخدام أيقونة افتراضية
    totalTrips: 12, // عدد الرحلات المكتملة
    points: 2450, // النقاط المكتسبة
    totalBookings: 15, // إجمالي الحجوزات
  );

  // يمكن إضافة مستخدمين آخرين للاختبار
  static const List<UserProfile> sampleUsers = [
    currentUser,
    UserProfile(
      name: 'سارة أحمد',
      email: 'sara.ahmed@example.com',
      phone: '+20 111 222 3333',
      totalTrips: 8,
      points: 1680,
      totalBookings: 10,
    ),
    UserProfile(
      name: 'محمد علي',
      email: 'mohamed.ali@example.com',
      phone: '+20 100 555 6666',
      totalTrips: 20,
      points: 4200,
      totalBookings: 25,
    ),
  ];
}
