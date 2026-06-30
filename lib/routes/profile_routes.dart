import 'package:go_router/go_router.dart';
import 'package:messenger/features/profile/presentation/screens/profile_screen.dart';
import 'package:messenger/routes/named_routes.dart';

StatefulShellBranch profileBranch() {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: NamedRoutes.profile,
        builder: (_, _) => const ProfileScreen(),
      ),
    ],
  );
}
