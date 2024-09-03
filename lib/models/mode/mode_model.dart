import 'package:freezed_annotation/freezed_annotation.dart';

part 'mode_model.freezed.dart';
part 'mode_model.g.dart';

@freezed
class ModeModel with _$ModeModel {
  factory ModeModel({
    required String modeid,
    required String modename,
  }) = _ModeModel;

  factory ModeModel.fromJson(Map<String, dynamic> json) =>
      _$ModeModelFromJson(json);
}
