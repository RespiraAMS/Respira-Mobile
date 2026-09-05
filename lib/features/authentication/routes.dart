import 'package:go_router/go_router.dart';

import 'screens/forgot_password_screen.dart';
import 'screens/login_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'screens/password_reset_success_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';

class AuthenticationRoutes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const login = '/login';
  static const forgotPassword = '/forgot-password';
  static const otpVerification = '/otp-verification';
  static const newPassword = '/new-password';
  static const passwordResetSuccess = '/password-reset-success';
}

final List<RouteBase> authenticationRoutes = [
  GoRoute(
    path: AuthenticationRoutes.splash,
    builder: (c, s) => const SplashScreen(),
  ),
  GoRoute(
    path: AuthenticationRoutes.welcome,
    builder: (c, s) => const WelcomeScreen(),
  ),
  GoRoute(
    path: AuthenticationRoutes.login,
    builder: (c, s) => const LoginScreen(),
  ),
  GoRoute(
    path: AuthenticationRoutes.forgotPassword,
    builder: (c, s) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: AuthenticationRoutes.otpVerification,
    builder: (c, s) => const OtpVerificationScreen(),
  ),
  GoRoute(
    path: AuthenticationRoutes.newPassword,
    builder: (c, s) => const NewPasswordScreen(),
  ),
  GoRoute(
    path: AuthenticationRoutes.passwordResetSuccess,
    builder: (c, s) => const PasswordResetSuccessScreen(),
  ),
];
