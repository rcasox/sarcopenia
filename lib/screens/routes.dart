import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sarcopenia/providers/auth_provider.dart';
import 'package:sarcopenia/screens/home_screen.dart';
import 'package:sarcopenia/screens/login_screen.dart';
import 'package:sarcopenia/screens/signup_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final user = authState.maybeWhen(
        data: (user) => user,
        orElse: () => null,
      );

      final isLoggingIn =
          state.fullPath == '/login' || state.fullPath == '/signup';

      if (user == null) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    ],
  );
});
