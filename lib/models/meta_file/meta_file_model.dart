import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_file_model.freezed.dart';
part 'meta_file_model.g.dart';

@freezed
class MetafileModel with _$MetafileModel {
  factory MetafileModel({
    required String remote,
    String? thumbnail,
  }) = _MetafileModel;

  factory MetafileModel.fromJson(Map<String, dynamic> json) =>
      _$MetafileModelFromJson(json);
}
