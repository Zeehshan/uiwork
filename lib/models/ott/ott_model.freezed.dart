// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ott_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OttModel _$OttModelFromJson(Map<String, dynamic> json) {
  return _OttModel.fromJson(json);
}

/// @nodoc
mixin _$OttModel {
  String get sid => throw _privateConstructorUsedError;
  String get sname => throw _privateConstructorUsedError;

  /// Serializes this OttModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OttModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OttModelCopyWith<OttModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OttModelCopyWith<$Res> {
  factory $OttModelCopyWith(OttModel value, $Res Function(OttModel) then) =
      _$OttModelCopyWithImpl<$Res, OttModel>;
  @useResult
  $Res call({String sid, String sname});
}

/// @nodoc
class _$OttModelCopyWithImpl<$Res, $Val extends OttModel>
    implements $OttModelCopyWith<$Res> {
  _$OttModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OttModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sid = null,
    Object? sname = null,
  }) {
    return _then(_value.copyWith(
      sid: null == sid
          ? _value.sid
          : sid // ignore: cast_nullable_to_non_nullable
              as String,
      sname: null == sname
          ? _value.sname
          : sname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OttModelImplCopyWith<$Res>
    implements $OttModelCopyWith<$Res> {
  factory _$$OttModelImplCopyWith(
          _$OttModelImpl value, $Res Function(_$OttModelImpl) then) =
      __$$OttModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sid, String sname});
}

/// @nodoc
class __$$OttModelImplCopyWithImpl<$Res>
    extends _$OttModelCopyWithImpl<$Res, _$OttModelImpl>
    implements _$$OttModelImplCopyWith<$Res> {
  __$$OttModelImplCopyWithImpl(
      _$OttModelImpl _value, $Res Function(_$OttModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OttModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sid = null,
    Object? sname = null,
  }) {
    return _then(_$OttModelImpl(
      sid: null == sid
          ? _value.sid
          : sid // ignore: cast_nullable_to_non_nullable
              as String,
      sname: null == sname
          ? _value.sname
          : sname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OttModelImpl implements _OttModel {
  _$OttModelImpl({required this.sid, required this.sname});

  factory _$OttModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OttModelImplFromJson(json);

  @override
  final String sid;
  @override
  final String sname;

  @override
  String toString() {
    return 'OttModel(sid: $sid, sname: $sname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OttModelImpl &&
            (identical(other.sid, sid) || other.sid == sid) &&
            (identical(other.sname, sname) || other.sname == sname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sid, sname);

  /// Create a copy of OttModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OttModelImplCopyWith<_$OttModelImpl> get copyWith =>
      __$$OttModelImplCopyWithImpl<_$OttModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OttModelImplToJson(
      this,
    );
  }
}

abstract class _OttModel implements OttModel {
  factory _OttModel({required final String sid, required final String sname}) =
      _$OttModelImpl;

  factory _OttModel.fromJson(Map<String, dynamic> json) =
      _$OttModelImpl.fromJson;

  @override
  String get sid;
  @override
  String get sname;

  /// Create a copy of OttModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OttModelImplCopyWith<_$OttModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
