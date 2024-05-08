// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaKeyModelImpl _$$MetaKeyModelImplFromJson(Map<String, dynamic> json) =>
    _$MetaKeyModelImpl(
      namespace: json['namespace'] as String,
      app: json['app'] as String,
      path: json['path'] as String,
      kind: json['kind'] as String,
      name: json['name'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$MetaKeyModelImplToJson(_$MetaKeyModelImpl instance) =>
    <String, dynamic>{
      'namespace': instance.namespace,
      'app': instance.app,
      'path': instance.path,
      'kind': instance.kind,
      'name': instance.name,
      'id': instance.id,
    };
