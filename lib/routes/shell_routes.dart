import 'package:go_router/go_router.dart';
import 'package:messenger/features/common/presentation/screens/main_screen.dart';
import 'package:messenger/routes/chat_routes.dart';
import 'package:messenger/routes/contact_routes.dart';
import 'package:messenger/routes/profile_routes.dart';
import 'package:messenger/routes/settings_routes.dart';

StatefulShellRoute shellRoute() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => MainScreen(),
    branches: [
      chatBranch(),
      contactsBranch(),
      settingsBranch(),
      profileBranch(),
    ],
  );
}
