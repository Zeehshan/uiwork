import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_cat_model.freezed.dart';
part 'view_cat_model.g.dart';

@freezed
class ViewCatModel with _$ViewCatModel {
  factory ViewCatModel({
    required String? integer,
    required String? string,
    required String? provided,
  }) = _ViewCatModel;
  factory ViewCatModel.fromJson(Map<String, dynamic> json) =>
      _$ViewCatModelFromJson(json);
}
