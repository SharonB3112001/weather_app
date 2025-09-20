import 'package:realm/realm.dart';

part 'realm_models.realm.dart';

@RealmModel()
class _EventRealm {
  @PrimaryKey()
  late String id;
  late String type;
  late String description;
  late DateTime date;
  late String location;
  late double latitude;   
  late double longitude;  
}

@RealmModel()
class _WeatherDayRealm {
  @PrimaryKey()
  late String id;
  late DateTime date;
  late double temperature;
  late String description;
}
