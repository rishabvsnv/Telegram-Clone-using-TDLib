import 'package:flutter/material.dart';
import 'package:messenger/core/constants/image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? customTitle;
  final List<Widget>? actions;
  final bool isDashboard;
  final bool isCenterTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.customTitle,
    this.actions,
    this.isDashboard = false,
    this.isCenterTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (customTitle ?? Text(title)),
      centerTitle: isCenterTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
