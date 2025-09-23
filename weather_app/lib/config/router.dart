import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/events/presentation/pages/event_page.dart';
import '../features/forecast/presentation/pages/forecast_page.dart';
import '../features/favorites/presentation/favorites_page.dart';
import '../features/map/presentation/map_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_screen.dart';
import '../features/chat/presentation/pages/chat_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: '/events',
        builder: (_, __) => const EventPage(),
      ),
      GoRoute(
        path: '/forecast',
        builder: (_, __) => const ForecastPage(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (_, __) => const FavoritesPage(),
      ),
      GoRoute(
        path: '/map',
        builder: (_, __) => const MapPage(),
      ),
      GoRoute(
        path: '/chat',
        builder: (_, __) => const ChatPage(),
      ),
    ],
  );
});
