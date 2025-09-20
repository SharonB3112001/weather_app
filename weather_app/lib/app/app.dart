import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/router.dart';
import '../config/theme.dart';
import '../config/flavors.dart';

class MyApp extends ConsumerWidget {
  final FlavorConfig flavorConfig;

  const MyApp({super.key, required this.flavorConfig});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: flavorConfig.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
