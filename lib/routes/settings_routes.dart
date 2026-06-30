import 'package:go_router/go_router.dart';
import 'package:messenger/features/folders/presentation/screens/folders_screen.dart';
import 'package:messenger/features/settings/presentation/screens/appearance_screen.dart';
import 'package:messenger/features/settings/presentation/screens/devices_screen.dart';
import 'package:messenger/features/settings/presentation/screens/language_screen.dart';
import 'package:messenger/features/settings/presentation/screens/notifications_screen.dart';
import 'package:messenger/features/settings/presentation/screens/privacy_screen.dart';
import 'package:messenger/features/settings/presentation/screens/setting_screen.dart';
import 'package:messenger/features/settings/presentation/screens/storage_screen.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/routes/route_helpers.dart';

StatefulShellBranch settingsBranch() {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: NamedRoutes.settings,
        builder: (_, _) => const SettingScreen(),
        routes: [
          simpleRoute('appearance', const AppearanceScreen()),
          simpleRoute('privacy', const PrivacyScreen()),
          simpleRoute('language', const LanguageScreen()),
          simpleRoute('notifications', const NotificationsScreen()),
          simpleRoute('storage', const StorageScreen()),
          simpleRoute('devices', const DevicesScreen()),
          simpleRoute('folders', const FoldersScreen()),
        ],
      ),
    ],
  );
}
