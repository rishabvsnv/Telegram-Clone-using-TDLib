import 'package:go_router/go_router.dart';
import 'package:messenger/features/auth/presentation/screens/login_screen.dart';
import 'package:messenger/features/auth/presentation/screens/otp_screen.dart';
import 'package:messenger/features/auth/presentation/screens/splash_screen.dart';
import 'package:messenger/routes/named_routes.dart';

final List<RouteBase> authRoutes = [
  GoRoute(path: NamedRoutes.splash, builder: (_, _) => const SplashScreen()),
  GoRoute(path: NamedRoutes.login, builder: (_, _) => const LoginScreen()),
  GoRoute(path: NamedRoutes.otp, builder: (_, _) => const OtpScreen()),
];
