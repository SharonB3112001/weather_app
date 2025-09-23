import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final locationProvider = StateProvider<LatLng?>((ref) => null);
