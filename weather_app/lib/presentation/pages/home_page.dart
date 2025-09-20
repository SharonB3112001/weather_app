import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeatherApp")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Eventos climáticos"),
            onTap: () => context.go('/events'),
          ),
          ListTile(
            title: const Text("Clima últimos 5 días"),
            onTap: () => context.go('/forecast'),
          ),
          ListTile(
            title: const Text("Favoritos"),
            onTap: () => context.go('/favorites'),
          ),
          ListTile(
            title: const Text("Mapa"),
            onTap: () => context.go('/map'),
          ),
        ],
      ),
    );
  }
}
