// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      content: json['content'] as String,
      idFrom: json['id_from'] as String,
      idTo: json['id_to'] as String,
      timeStamp: const TimeStamptoDateConverter()
          .fromJson(json['time_stamp'] as Timestamp),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id_from': instance.idFrom,
      'id_to': instance.idTo,
      'time_stamp': const TimeStamptoDateConverter().toJson(instance.timeStamp),
    };
