import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/features/auth/pages/login_view.dart';
import 'package:user_inter_face_2/features/auth/pages/sing_in_page.dart';
import 'package:user_inter_face_2/features/home/data/destination_model.dart';
import 'package:user_inter_face_2/features/home/pages/home_detiles.dart';
import 'package:user_inter_face_2/features/payment/data/payment_method_model.dart';
import 'package:user_inter_face_2/features/payment/pages/payment_confirmation_page.dart';
import 'package:user_inter_face_2/features/payment/pages/payment_details_page.dart';
import 'package:user_inter_face_2/features/payment/pages/payment_methods_page.dart';
import 'package:user_inter_face_2/rote.dart';
import 'package:user_inter_face_2/splsah_page.dart';

abstract class AppRouter {
  // Paths لكل صفحة
  static const splash = '/';
  static const signIn = '/signIn';
  static const login = '/login';
  static const home = '/home';
  static const home_detils = '/home_detils';
  static const payment_methods = '/payment_methods';
  static const payment_details = '/payment_details';
  static const payment_confirmation = '/payment_confirmation';

  // GoRouter setup
  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplsahPage()),
      GoRoute(path: signIn, builder: (context, state) => SingInPage()),
      GoRoute(path: login, builder: (context, state) => LoginView()),
      GoRoute(path: home, builder: (context, state) => const Rote()),
      GoRoute(
        path: home_detils,
        builder: (context, state) {
          final destination = state.extra as Destination;
          return HomeDetiles(destination: destination);
        },
      ),
      GoRoute(
        path: payment_methods,
        builder: (context, state) {
          final destination = state.extra as Destination;
          return PaymentMethodsPage(destination: destination);
        },
      ),
      GoRoute(
        path: payment_details,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return PaymentDetailsPage(
            destination: data['destination'] as Destination,
            paymentMethod: data['paymentMethod'] as PaymentMethod,
          );
        },
      ),
      GoRoute(
        path: payment_confirmation,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return PaymentConfirmationPage(
            destination: data['destination'] as Destination,
            paymentMethod: data['paymentMethod'] as PaymentMethod,
            cardNumber: data['cardNumber'] as String,
          );
        },
      ),
    ],
  );
}
