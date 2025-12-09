import 'package:go_router/go_router.dart';
import 'package:user_inter_face_2/features/auth/pages/login_view.dart';
import 'package:user_inter_face_2/features/auth/pages/sing_in_page.dart';
import 'package:user_inter_face_2/splsah_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/', // Start at splash
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplsahPage()),
      GoRoute(path: '/signIn', builder: (context, state) => SingInPage()),
      GoRoute(path: '/login', builder: (context, state) => LoginView()),
    ],
  );
}
