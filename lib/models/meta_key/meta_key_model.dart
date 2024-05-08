import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_key_model.freezed.dart';
part 'meta_key_model.g.dart';

@freezed
class MetaKeyModel with _$MetaKeyModel {
  factory MetaKeyModel({
    required String namespace,
    required String app,
    required String path,
    required String kind,
    required String name,
    required String? id,
  }) = _MetaKeyModel;

  factory MetaKeyModel.fromJson(Map<String, dynamic> json) =>
      _$MetaKeyModelFromJson(json);
}
