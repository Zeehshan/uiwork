// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_cat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewCatModel _$ViewCatModelFromJson(Map<String, dynamic> json) {
  return _ViewCatModel.fromJson(json);
}

/// @nodoc
mixin _$ViewCatModel {
  String? get integer => throw _privateConstructorUsedError;
  String? get string => throw _privateConstructorUsedError;
  String? get provided => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewCatModelCopyWith<ViewCatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewCatModelCopyWith<$Res> {
  factory $ViewCatModelCopyWith(
          ViewCatModel value, $Res Function(ViewCatModel) then) =
      _$ViewCatModelCopyWithImpl<$Res, ViewCatModel>;
  @useResult
  $Res call({String? integer, String? string, String? provided});
}

/// @nodoc
class _$ViewCatModelCopyWithImpl<$Res, $Val extends ViewCatModel>
    implements $ViewCatModelCopyWith<$Res> {
  _$ViewCatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? integer = freezed,
    Object? string = freezed,
    Object? provided = freezed,
  }) {
    return _then(_value.copyWith(
      integer: freezed == integer
          ? _value.integer
          : integer // ignore: cast_nullable_to_non_nullable
              as String?,
      string: freezed == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String?,
      provided: freezed == provided
          ? _value.provided
          : provided // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewCatModelImplCopyWith<$Res>
    implements $ViewCatModelCopyWith<$Res> {
  factory _$$ViewCatModelImplCopyWith(
          _$ViewCatModelImpl value, $Res Function(_$ViewCatModelImpl) then) =
      __$$ViewCatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? integer, String? string, String? provided});
}

/// @nodoc
class __$$ViewCatModelImplCopyWithImpl<$Res>
    extends _$ViewCatModelCopyWithImpl<$Res, _$ViewCatModelImpl>
    implements _$$ViewCatModelImplCopyWith<$Res> {
  __$$ViewCatModelImplCopyWithImpl(
      _$ViewCatModelImpl _value, $Res Function(_$ViewCatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? integer = freezed,
    Object? string = freezed,
    Object? provided = freezed,
  }) {
    return _then(_$ViewCatModelImpl(
      integer: freezed == integer
          ? _value.integer
          : integer // ignore: cast_nullable_to_non_nullable
              as String?,
      string: freezed == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String?,
      provided: freezed == provided
          ? _value.provided
          : provided // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewCatModelImpl implements _ViewCatModel {
  _$ViewCatModelImpl(
      {required this.integer, required this.string, required this.provided});

  factory _$ViewCatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewCatModelImplFromJson(json);

  @override
  final String? integer;
  @override
  final String? string;
  @override
  final String? provided;

  @override
  String toString() {
    return 'ViewCatModel(integer: $integer, string: $string, provided: $provided)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCatModelImpl &&
            (identical(other.integer, integer) || other.integer == integer) &&
            (identical(other.string, string) || other.string == string) &&
            (identical(other.provided, provided) ||
                other.provided == provided));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, integer, string, provided);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCatModelImplCopyWith<_$ViewCatModelImpl> get copyWith =>
      __$$ViewCatModelImplCopyWithImpl<_$ViewCatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewCatModelImplToJson(
      this,
    );
  }
}

abstract class _ViewCatModel implements ViewCatModel {
  factory _ViewCatModel(
      {required final String? integer,
      required final String? string,
      required final String? provided}) = _$ViewCatModelImpl;

  factory _ViewCatModel.fromJson(Map<String, dynamic> json) =
      _$ViewCatModelImpl.fromJson;

  @override
  String? get integer;
  @override
  String? get string;
  @override
  String? get provided;
  @override
  @JsonKey(ignore: true)
  _$$ViewCatModelImplCopyWith<_$ViewCatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
