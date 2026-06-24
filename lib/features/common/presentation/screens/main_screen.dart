import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messenger/features/chats/presentation/screens/chat_screen.dart';
import 'package:messenger/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:messenger/features/profile/presentation/screens/profile_screen.dart';
import 'package:messenger/features/settings/presentation/screens/setting_screen.dart';

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
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: const [
              ChatScreen(),
              ContactsScreen(),
              SettingScreen(),
              ProfileScreen(),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 50,
            child: IgnorePointer(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              top: false,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _item(
                          icon: Icons.chat_bubble_outline_rounded,
                          label: 'Chats',
                          index: 0,
                          badgeCount: 12,
                        ),
                        _item(
                          icon: Icons.people_outline_rounded,
                          label: 'Contacts',
                          index: 1,
                        ),
                        _item(
                          icon: Icons.settings_outlined,
                          label: 'Settings',
                          index: 2,
                        ),
                        _item(avatarText: 'R', label: 'Profile', index: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item({
    IconData? icon,
    String? avatarText,
    required String label,
    required int index,
    int badgeCount = 0,
  }) {
    final selected = currentIndex == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  avatarText != null
                      ? CircleAvatar(
                          radius: 12,
                          backgroundColor: selected
                              ? const Color(0xff229ED9)
                              : Colors.pink.shade300,
                          child: Text(
                            avatarText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Icon(
                          icon,
                          size: 24,
                          color: selected
                              ? const Color(0xff229ED9)
                              : Colors.grey,
                        ),

                  if (badgeCount > 0)
                    Positioned(
                      right: -8,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 1,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          badgeCount > 99 ? '99+' : '$badgeCount',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 4),

              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected ? const Color(0xff229ED9) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
