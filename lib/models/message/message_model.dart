import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/utils.dart';
part 'message_model.g.dart';
part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory MessageModel({
    required String content,
    required String idFrom,
    required String idTo,
    @JsonKey(name: 'time_stamp')
    @TimeStamptoDateConverter()
    required DateTime timeStamp,
  }) = _MessageModel;

  factory MessageModel.fromJson(json) => _$MessageModelFromJson(json);
}
