import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:messenger/features/auth/presentation/screens/login_screen.dart';
import 'package:messenger/features/chats/presentation/screens/chat_screen.dart';
import 'package:messenger/features/archives/presentation/screens/archive_screen.dart';
import 'package:messenger/features/profile/presentation/screens/profile_screen.dart';
import 'package:messenger/features/settings/presentation/screens/setting_screen.dart';
import 'package:messenger/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:messenger/features/calls/presentation/screens/calls_screen.dart';
import 'package:messenger/features/folders/presentation/screens/folders_screen.dart';
import 'package:messenger/features/devices/presentation/screens/devices_screen.dart';
import 'package:messenger/features/messages/presentation/screens/messages_screen.dart';
import 'package:messenger/features/saved_messages/presentation/screens/saved_messages_screen.dart';
import 'package:messenger/features/groups/presentation/screens/new_group_screen.dart';
import 'package:messenger/features/channels/presentation/screens/new_channel_screen.dart';
import 'package:messenger/features/nearby/presentation/screens/people_nearby_screen.dart';
import 'package:messenger/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:messenger/features/privacy/presentation/screens/privacy_screen.dart';
import 'package:messenger/features/storage/presentation/screens/storage_screen.dart';
import 'package:messenger/features/profile/presentation/screens/my_qr_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/chats',
    routes: [
      // Auth
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      // Chats
      GoRoute(path: '/chats', builder: (context, state) => const ChatScreen()),

      // Archive
      GoRoute(
        path: '/archive',
        builder: (context, state) => const ArchiveScreen(),
      ),

      GoRoute(
        path: '/messages',
        builder: (context, state) => const MessagesScreen(chatId: '1'),
      ),

      // Profile
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),

      // Settings
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),

      // Contacts
      GoRoute(
        path: '/contacts',
        builder: (context, state) => const ContactsScreen(),
      ),

      // Calls
      GoRoute(path: '/calls', builder: (context, state) => const CallsScreen()),

      // Devices
      GoRoute(
        path: '/devices',
        builder: (context, state) => const DevicesScreen(),
      ),

      // Folders
      GoRoute(
        path: '/folders',
        builder: (context, state) => const FoldersScreen(),
      ),

      // Saved Messages
      GoRoute(
        path: '/saved-messages',
        builder: (context, state) => const SavedMessagesScreen(),
      ),

      // New Group
      GoRoute(
        path: '/new-group',
        builder: (context, state) => const NewGroupScreen(),
      ),

      // New Channel
      GoRoute(
        path: '/new-channel',
        builder: (context, state) => const NewChannelScreen(),
      ),

      // People Nearby
      GoRoute(
        path: '/people-nearby',
        builder: (context, state) => const PeopleNearbyScreen(),
      ),

      // Notifications
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),

      // Privacy & Security
      GoRoute(
        path: '/privacy',
        builder: (context, state) => const PrivacyScreen(),
      ),

      // Storage Usage
      GoRoute(
        path: '/storage',
        builder: (context, state) => const StorageScreen(),
      ),

      // QR
      GoRoute(path: '/my-qr', builder: (context, state) => const MyQrScreen()),
    ],
  );
});
