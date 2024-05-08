import 'package:freezed_annotation/freezed_annotation.dart';

class StringToIntConverter implements JsonConverter<int, dynamic> {
  const StringToIntConverter();

  @override
  int fromJson(dynamic json) => json is int ? json : int.parse(json);

  @override
  String toJson(int object) => object.toString();
}
