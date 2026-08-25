import 'package:go_router/go_router.dart';

import 'screens/forgot_password_screen.dart';
import 'screens/login_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'screens/password_reset_success_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';

final List<RouteBase> authenticationRoutes = [
  GoRoute(path: '/splash', builder: (c, s) => const SplashScreen()),
  GoRoute(path: '/welcome', builder: (c, s) => const WelcomeScreen()),
  GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
  GoRoute(
    path: '/forgot-password',
    builder: (c, s) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: '/otp-verification',
    builder: (c, s) => const OtpVerificationScreen(),
  ),
  GoRoute(path: '/new-password', builder: (c, s) => const NewPasswordScreen()),
  GoRoute(
    path: '/password-reset-success',
    builder: (c, s) => const PasswordResetSuccessScreen(),
  ),
];
