import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/flavors.dart';
import 'app.dart';

void main() {
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
