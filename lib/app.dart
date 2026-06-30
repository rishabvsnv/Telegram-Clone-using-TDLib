import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messenger/core/constants/app_constants.dart';
import 'package:messenger/core/theme/app_theme.dart';
import 'package:messenger/generated/app_localizations.dart';
import 'package:messenger/routes/app_router2.dart';

class MyMessengerApp extends ConsumerWidget {
  const MyMessengerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: router,
        localizationsDelegates: [AppLocalizations.delegate],

        supportedLocales: const [Locale('en')],

        // builder: (context, state) {},
      ),
    );
  }
}
