import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/features/auth/pages/login_view.dart';
import 'package:user_inter_face_2/features/auth/pages/sing_in_page.dart';
import 'package:user_inter_face_2/features/home/pages/home_page.dart';
import 'package:user_inter_face_2/splsah_page.dart';
abstract class AppRouter {
  // Paths لكل صفحة
  static const splash = '/';
  static const signIn = '/signIn';
  static const login = '/login';
  static const home = '/home';

  // GoRouter setup
  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplsahPage(),
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) => SingInPage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}
