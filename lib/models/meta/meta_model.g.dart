// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaModelImpl _$$MetaModelImplFromJson(Map<String, dynamic> json) =>
    _$MetaModelImpl(
      metaid: json['metaid'] as String,
      metasize: json['metasize'] as String?,
      metatext: json['metatext'] as String?,
      metatime: json['metatime'] as String?,
      metatype: json['metatype'] as String?,
      participant: json['participant'] as String?,
      viewcat: json['viewcat'] == null
          ? null
          : ViewCatModel.fromJson(json['viewcat'] as Map<String, dynamic>),
      gtext: json['gtext'] as String?,
      gtype: json['gtype'] as String?,
      dtime: json['dtime'] as String?,
      rtime: json['rtime'] as String?,
      metalength: json['metalength'] as String?,
      metaKey: json['__key__'] == null
          ? null
          : MetaKeyModel.fromJson(json['__key__'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetaModelImplToJson(_$MetaModelImpl instance) =>
    <String, dynamic>{
      'metaid': instance.metaid,
      'metasize': instance.metasize,
      'metatext': instance.metatext,
      'metatime': instance.metatime,
      'metatype': instance.metatype,
      'participant': instance.participant,
      'viewcat': instance.viewcat,
      'gtext': instance.gtext,
      'gtype': instance.gtype,
      'dtime': instance.dtime,
      'rtime': instance.rtime,
      'metalength': instance.metalength,
      '__key__': instance.metaKey,
    };
