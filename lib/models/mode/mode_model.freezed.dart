// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModeModel _$ModeModelFromJson(Map<String, dynamic> json) {
  return _ModeModel.fromJson(json);
}

/// @nodoc
mixin _$ModeModel {
  String get modeid => throw _privateConstructorUsedError;
  String get modename => throw _privateConstructorUsedError;

  /// Serializes this ModeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModeModelCopyWith<ModeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModeModelCopyWith<$Res> {
  factory $ModeModelCopyWith(ModeModel value, $Res Function(ModeModel) then) =
      _$ModeModelCopyWithImpl<$Res, ModeModel>;
  @useResult
  $Res call({String modeid, String modename});
}

/// @nodoc
class _$ModeModelCopyWithImpl<$Res, $Val extends ModeModel>
    implements $ModeModelCopyWith<$Res> {
  _$ModeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modeid = null,
    Object? modename = null,
  }) {
    return _then(_value.copyWith(
      modeid: null == modeid
          ? _value.modeid
          : modeid // ignore: cast_nullable_to_non_nullable
              as String,
      modename: null == modename
          ? _value.modename
          : modename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModeModelImplCopyWith<$Res>
    implements $ModeModelCopyWith<$Res> {
  factory _$$ModeModelImplCopyWith(
          _$ModeModelImpl value, $Res Function(_$ModeModelImpl) then) =
      __$$ModeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String modeid, String modename});
}

/// @nodoc
class __$$ModeModelImplCopyWithImpl<$Res>
    extends _$ModeModelCopyWithImpl<$Res, _$ModeModelImpl>
    implements _$$ModeModelImplCopyWith<$Res> {
  __$$ModeModelImplCopyWithImpl(
      _$ModeModelImpl _value, $Res Function(_$ModeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modeid = null,
    Object? modename = null,
  }) {
    return _then(_$ModeModelImpl(
      modeid: null == modeid
          ? _value.modeid
          : modeid // ignore: cast_nullable_to_non_nullable
              as String,
      modename: null == modename
          ? _value.modename
          : modename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModeModelImpl implements _ModeModel {
  _$ModeModelImpl({required this.modeid, required this.modename});

  factory _$ModeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModeModelImplFromJson(json);

  @override
  final String modeid;
  @override
  final String modename;

  @override
  String toString() {
    return 'ModeModel(modeid: $modeid, modename: $modename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModeModelImpl &&
            (identical(other.modeid, modeid) || other.modeid == modeid) &&
            (identical(other.modename, modename) ||
                other.modename == modename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, modeid, modename);

  /// Create a copy of ModeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModeModelImplCopyWith<_$ModeModelImpl> get copyWith =>
      __$$ModeModelImplCopyWithImpl<_$ModeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModeModelImplToJson(
      this,
    );
  }
}

abstract class _ModeModel implements ModeModel {
  factory _ModeModel(
      {required final String modeid,
      required final String modename}) = _$ModeModelImpl;

  factory _ModeModel.fromJson(Map<String, dynamic> json) =
      _$ModeModelImpl.fromJson;

  @override
  String get modeid;
  @override
  String get modename;

  /// Create a copy of ModeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModeModelImplCopyWith<_$ModeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
