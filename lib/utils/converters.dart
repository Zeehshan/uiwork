import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class StringToIntConverter implements JsonConverter<int, dynamic> {
  const StringToIntConverter();

  @override
  int fromJson(dynamic json) => json is int ? json : int.parse(json);

  @override
  String toJson(int object) => object.toString();
}

class TimeStamptoDateConverter implements JsonConverter<DateTime, Timestamp> {
  const TimeStamptoDateConverter();
  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
