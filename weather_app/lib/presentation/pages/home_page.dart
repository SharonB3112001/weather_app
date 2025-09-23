import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../features/map/presentation/map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapPage(),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                "Seleccionar ubicación",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildSpeedDial(context),
    );
  }

  Widget _buildSpeedDial(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Colors.white.withOpacity(0.9),
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.warning_amber_rounded, color: Colors.white),
          backgroundColor: Colors.redAccent,
          label: 'Eventos climáticos',
          labelBackgroundColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
          onTap: () => context.push('/events'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.cloud, color: Colors.white),
          backgroundColor: Colors.blueAccent,
          label: 'Clima 5 días',
          labelBackgroundColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
          onTap: () => context.push('/forecast'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.favorite, color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          label: 'Favoritos',
          labelBackgroundColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
          onTap: () => context.push('/favorites'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.chat, color: Colors.white),
          backgroundColor: Colors.green,
          label: 'Chat IA',
          labelBackgroundColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
          onTap: () => context.push('/chat'),
        ),
      ],
    );
  }
}
