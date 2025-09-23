import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/flavors.dart';
import '../config/environment.dart'; 
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.init();

  const flavor = FlavorConfig(
    appName: "WeatherApp",
    flavor: Flavor.prod,
  );

  runApp(
    ProviderScope(
      child: MyApp(flavorConfig: flavor),
    ),
  );
}
