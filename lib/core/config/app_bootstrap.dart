import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messenger/app.dart';

Future<void> bootstrapApp() async {
  runZoned(() {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const ProviderScope(child: MyMessengerApp()));
  });
}
