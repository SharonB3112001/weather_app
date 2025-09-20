// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class EventRealm extends _EventRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  EventRealm(
    String id,
    String type,
    String description,
    DateTime date,
    String location,
    double latitude,
    double longitude,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
  }

  EventRealm._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  String get location =>
      RealmObjectBase.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObjectBase.set(this, 'location', value);

  @override
  double get latitude =>
      RealmObjectBase.get<double>(this, 'latitude') as double;
  @override
  set latitude(double value) => RealmObjectBase.set(this, 'latitude', value);

  @override
  double get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double;
  @override
  set longitude(double value) => RealmObjectBase.set(this, 'longitude', value);

  @override
  Stream<RealmObjectChanges<EventRealm>> get changes =>
      RealmObjectBase.getChanges<EventRealm>(this);

  @override
  Stream<RealmObjectChanges<EventRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<EventRealm>(this, keyPaths);

  @override
  EventRealm freeze() => RealmObjectBase.freezeObject<EventRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'type': type.toEJson(),
      'description': description.toEJson(),
      'date': date.toEJson(),
      'location': location.toEJson(),
      'latitude': latitude.toEJson(),
      'longitude': longitude.toEJson(),
    };
  }

  static EJsonValue _toEJson(EventRealm value) => value.toEJson();
  static EventRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'type': EJsonValue type,
        'description': EJsonValue description,
        'date': EJsonValue date,
        'location': EJsonValue location,
        'latitude': EJsonValue latitude,
        'longitude': EJsonValue longitude,
      } =>
        EventRealm(
          fromEJson(id),
          fromEJson(type),
          fromEJson(description),
          fromEJson(date),
          fromEJson(location),
          fromEJson(latitude),
          fromEJson(longitude),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(EventRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, EventRealm, 'EventRealm', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('latitude', RealmPropertyType.double),
      SchemaProperty('longitude', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class WeatherDayRealm extends _WeatherDayRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  WeatherDayRealm(
    String id,
    DateTime date,
    double temperature,
    String description,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'temperature', temperature);
    RealmObjectBase.set(this, 'description', description);
  }

  WeatherDayRealm._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  double get temperature =>
      RealmObjectBase.get<double>(this, 'temperature') as double;
  @override
  set temperature(double value) =>
      RealmObjectBase.set(this, 'temperature', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  Stream<RealmObjectChanges<WeatherDayRealm>> get changes =>
      RealmObjectBase.getChanges<WeatherDayRealm>(this);

  @override
  Stream<RealmObjectChanges<WeatherDayRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<WeatherDayRealm>(this, keyPaths);

  @override
  WeatherDayRealm freeze() =>
      RealmObjectBase.freezeObject<WeatherDayRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'date': date.toEJson(),
      'temperature': temperature.toEJson(),
      'description': description.toEJson(),
    };
  }

  static EJsonValue _toEJson(WeatherDayRealm value) => value.toEJson();
  static WeatherDayRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'date': EJsonValue date,
        'temperature': EJsonValue temperature,
        'description': EJsonValue description,
      } =>
        WeatherDayRealm(
          fromEJson(id),
          fromEJson(date),
          fromEJson(temperature),
          fromEJson(description),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(WeatherDayRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, WeatherDayRealm, 'WeatherDayRealm', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('temperature', RealmPropertyType.double),
      SchemaProperty('description', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
