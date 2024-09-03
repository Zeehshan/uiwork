// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetafileModel _$MetafileModelFromJson(Map<String, dynamic> json) {
  return _MetafileModel.fromJson(json);
}

/// @nodoc
mixin _$MetafileModel {
  String get remote => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  /// Serializes this MetafileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetafileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetafileModelCopyWith<MetafileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetafileModelCopyWith<$Res> {
  factory $MetafileModelCopyWith(
          MetafileModel value, $Res Function(MetafileModel) then) =
      _$MetafileModelCopyWithImpl<$Res, MetafileModel>;
  @useResult
  $Res call({String remote, String? thumbnail});
}

/// @nodoc
class _$MetafileModelCopyWithImpl<$Res, $Val extends MetafileModel>
    implements $MetafileModelCopyWith<$Res> {
  _$MetafileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetafileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remote = null,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      remote: null == remote
          ? _value.remote
          : remote // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetafileModelImplCopyWith<$Res>
    implements $MetafileModelCopyWith<$Res> {
  factory _$$MetafileModelImplCopyWith(
          _$MetafileModelImpl value, $Res Function(_$MetafileModelImpl) then) =
      __$$MetafileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remote, String? thumbnail});
}

/// @nodoc
class __$$MetafileModelImplCopyWithImpl<$Res>
    extends _$MetafileModelCopyWithImpl<$Res, _$MetafileModelImpl>
    implements _$$MetafileModelImplCopyWith<$Res> {
  __$$MetafileModelImplCopyWithImpl(
      _$MetafileModelImpl _value, $Res Function(_$MetafileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetafileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remote = null,
    Object? thumbnail = freezed,
  }) {
    return _then(_$MetafileModelImpl(
      remote: null == remote
          ? _value.remote
          : remote // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetafileModelImpl implements _MetafileModel {
  _$MetafileModelImpl({required this.remote, this.thumbnail});

  factory _$MetafileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetafileModelImplFromJson(json);

  @override
  final String remote;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'MetafileModel(remote: $remote, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetafileModelImpl &&
            (identical(other.remote, remote) || other.remote == remote) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remote, thumbnail);

  /// Create a copy of MetafileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetafileModelImplCopyWith<_$MetafileModelImpl> get copyWith =>
      __$$MetafileModelImplCopyWithImpl<_$MetafileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetafileModelImplToJson(
      this,
    );
  }
}

abstract class _MetafileModel implements MetafileModel {
  factory _MetafileModel(
      {required final String remote,
      final String? thumbnail}) = _$MetafileModelImpl;

  factory _MetafileModel.fromJson(Map<String, dynamic> json) =
      _$MetafileModelImpl.fromJson;

  @override
  String get remote;
  @override
  String? get thumbnail;

  /// Create a copy of MetafileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetafileModelImplCopyWith<_$MetafileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
