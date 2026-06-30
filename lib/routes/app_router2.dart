import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/common/presentation/screens/main_screen.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/routes/routes_export.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // initialLocation: NamedRoutes.login,
    initialLocation: NamedRoutes.main,
    routes: [
      // Auth
      GoRoute(
        path: NamedRoutes.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: NamedRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NamedRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: NamedRoutes.otp,
        builder: (context, state) => const OtpScreen(),
      ),

      // Chats
      GoRoute(
        path: NamedRoutes.chats,
        builder: (context, state) => const ChatScreen(),
      ),

      GoRoute(
        path: NamedRoutes.chatWithParams,
        builder: (context, state) {
          final chatId = state.pathParameters['chatId']!;
          final userName = state.extra as String;

          return MessageInfoScreen(chatId: chatId, userName: userName);
        },
      ),

      // Archive
      GoRoute(
        path: NamedRoutes.archive,
        builder: (context, state) => const ArchivedChatsScreen(),
      ),

      // Profile
      GoRoute(
        path: NamedRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: NamedRoutes.profileEdit,
        builder: (context, state) => const ProfileScreen(),
      ),

      // Settings
      GoRoute(
        path: NamedRoutes.settings,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: NamedRoutes.appearance,
        builder: (context, state) => const AppearanceScreen(),
      ),
      GoRoute(
        path: NamedRoutes.language,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        path: NamedRoutes.privacy,
        builder: (context, state) => const PrivacyScreen(),
      ),
      GoRoute(
        path: NamedRoutes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: NamedRoutes.storage,
        builder: (context, state) => const StorageScreen(),
      ),
      GoRoute(
        path: NamedRoutes.devices,
        builder: (context, state) => const DevicesScreen(),
      ),
      GoRoute(
        path: NamedRoutes.folders,
        builder: (context, state) => const FoldersScreen(),
      ),

      GoRoute(
        path: NamedRoutes.blockedUsers,
        builder: (context, state) => const BlockedUsersScreen(),
      ),
      GoRoute(
        path: NamedRoutes.dataUsage,
        builder: (context, state) => const DataUsageScreen(),
      ),
      GoRoute(
        path: NamedRoutes.activeSessions,
        builder: (context, state) => const ActiveSessionsScreen(),
      ),

      // Contacts
      GoRoute(
        path: NamedRoutes.contacts,
        builder: (context, state) => const ContactsScreen(),
      ),
      GoRoute(
        path: '/contact/:userId',
        builder: (context, state) {
          final userId = state.pathParameters['userId']!;

          return ContactProfileScreen(userId: userId);
        },
      ),

      // Calls
      GoRoute(
        path: NamedRoutes.calls,
        builder: (context, state) => const CallsScreen(),
      ),

      // Saved Messages
      GoRoute(
        path: NamedRoutes.savedMessages,
        builder: (context, state) => const SavedMessagesScreen(),
      ),
      GoRoute(
        path: '/media/:mediaId',
        builder: (context, state) {
          final mediaId = state.pathParameters['mediaId']!;

          return MediaGalleryScreen(mediaId: mediaId);
        },
      ),

      // New Group
      GoRoute(
        path: NamedRoutes.newGroup,
        builder: (context, state) => const NewGroupScreen(),
      ),
      GoRoute(
        path: '/group/:groupId',
        builder: (context, state) {
          final groupId = state.pathParameters['groupId']!;

          return GroupInfoScreen(groupId: groupId);
        },
      ),

      // New Channel
      GoRoute(
        path: NamedRoutes.newChannel,
        builder: (context, state) => const NewChannelScreen(),
      ),
      GoRoute(
        path: '/channel/:channelId',
        builder: (context, state) {
          final channelId = state.pathParameters['channelId']!;

          return ChannelInfoScreen(channelId: channelId);
        },
      ),

      // People Nearby
      GoRoute(
        path: NamedRoutes.peopleNearby,
        builder: (context, state) => const PeopleNearbyScreen(),
      ),

      // QR
      GoRoute(
        path: NamedRoutes.myQR,
        builder: (context, state) => const QrCodeScreen(),
      ),

      GoRoute(
        path: NamedRoutes.telegramFeatures,
        builder: (context, state) => const TelegramFeaturesScreen(),
      ),
      GoRoute(
        path: NamedRoutes.share,
        builder: (context, state) => const ShareScreen(),
      ),
    ],
  );
});
