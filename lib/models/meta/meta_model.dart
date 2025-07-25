import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/utils.dart';
import '../models.dart';

part 'meta_model.freezed.dart';
part 'meta_model.g.dart';

@freezed
class MetaModel with _$MetaModel {
  const factory MetaModel({
    required String metaid,
    required int? metasize,
    required String? metatext,
    @TimeStamptoDateConverter() required DateTime metatime,
    required String? metatype,
    required String? participant,
    required ViewCatModel? viewcat,
    required String? gtext,
    required String? gtype,
    required String? dtime,
    required String? rtime,
    required String? metalength,
    @JsonKey(name: '__key__') MetaKeyModel? metaKey,
    required MetafileModel? file,
  }) = _MetaModel;

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}
