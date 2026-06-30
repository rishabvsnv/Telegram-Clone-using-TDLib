import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:messenger/features/chats/presentation/screens/chat_screen.dart';
import 'package:messenger/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:messenger/features/profile/presentation/screens/profile_screen.dart';
import 'package:messenger/features/settings/presentation/screens/setting_screen.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          ChatScreen(),
          ContactsScreen(),
          SettingScreen(),
          ProfileScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff229ED9),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('5'),
              isLabelVisible: true,
              child: Icon(PhosphorIconsRegular.chatCircle),
            ),
            activeIcon: Badge(
              label: Text('5'),
              isLabelVisible: true,
              child: Icon(PhosphorIconsFill.chatCircle),
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIconsRegular.users),
            activeIcon: Icon(PhosphorIconsFill.users),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIconsRegular.gear),
            activeIcon: Icon(PhosphorIconsFill.gear),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIconsRegular.user),
            activeIcon: Icon(PhosphorIconsFill.user),
            label: 'You',
          ),
        ],
      ),
    );
  }
}
