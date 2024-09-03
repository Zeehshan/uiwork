import 'package:freezed_annotation/freezed_annotation.dart';

part 'ott_model.freezed.dart';
part 'ott_model.g.dart';

@freezed
class OttModel with _$OttModel {
  factory OttModel({
    required String sid,
    required String sname,
  }) = _OttModel;

  factory OttModel.fromJson(Map<String, dynamic> json) =>
      _$OttModelFromJson(json);
}
