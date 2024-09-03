// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_key_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaKeyModel _$MetaKeyModelFromJson(Map<String, dynamic> json) {
  return _MetaKeyModel.fromJson(json);
}

/// @nodoc
mixin _$MetaKeyModel {
  String get namespace => throw _privateConstructorUsedError;
  String get app => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this MetaKeyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaKeyModelCopyWith<MetaKeyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaKeyModelCopyWith<$Res> {
  factory $MetaKeyModelCopyWith(
          MetaKeyModel value, $Res Function(MetaKeyModel) then) =
      _$MetaKeyModelCopyWithImpl<$Res, MetaKeyModel>;
  @useResult
  $Res call(
      {String namespace,
      String app,
      String path,
      String kind,
      String name,
      String? id});
}

/// @nodoc
class _$MetaKeyModelCopyWithImpl<$Res, $Val extends MetaKeyModel>
    implements $MetaKeyModelCopyWith<$Res> {
  _$MetaKeyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namespace = null,
    Object? app = null,
    Object? path = null,
    Object? kind = null,
    Object? name = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      namespace: null == namespace
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as String,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaKeyModelImplCopyWith<$Res>
    implements $MetaKeyModelCopyWith<$Res> {
  factory _$$MetaKeyModelImplCopyWith(
          _$MetaKeyModelImpl value, $Res Function(_$MetaKeyModelImpl) then) =
      __$$MetaKeyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String namespace,
      String app,
      String path,
      String kind,
      String name,
      String? id});
}

/// @nodoc
class __$$MetaKeyModelImplCopyWithImpl<$Res>
    extends _$MetaKeyModelCopyWithImpl<$Res, _$MetaKeyModelImpl>
    implements _$$MetaKeyModelImplCopyWith<$Res> {
  __$$MetaKeyModelImplCopyWithImpl(
      _$MetaKeyModelImpl _value, $Res Function(_$MetaKeyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namespace = null,
    Object? app = null,
    Object? path = null,
    Object? kind = null,
    Object? name = null,
    Object? id = freezed,
  }) {
    return _then(_$MetaKeyModelImpl(
      namespace: null == namespace
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as String,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaKeyModelImpl implements _MetaKeyModel {
  _$MetaKeyModelImpl(
      {required this.namespace,
      required this.app,
      required this.path,
      required this.kind,
      required this.name,
      required this.id});

  factory _$MetaKeyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaKeyModelImplFromJson(json);

  @override
  final String namespace;
  @override
  final String app;
  @override
  final String path;
  @override
  final String kind;
  @override
  final String name;
  @override
  final String? id;

  @override
  String toString() {
    return 'MetaKeyModel(namespace: $namespace, app: $app, path: $path, kind: $kind, name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaKeyModelImpl &&
            (identical(other.namespace, namespace) ||
                other.namespace == namespace) &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, namespace, app, path, kind, name, id);

  /// Create a copy of MetaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaKeyModelImplCopyWith<_$MetaKeyModelImpl> get copyWith =>
      __$$MetaKeyModelImplCopyWithImpl<_$MetaKeyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaKeyModelImplToJson(
      this,
    );
  }
}

abstract class _MetaKeyModel implements MetaKeyModel {
  factory _MetaKeyModel(
      {required final String namespace,
      required final String app,
      required final String path,
      required final String kind,
      required final String name,
      required final String? id}) = _$MetaKeyModelImpl;

  factory _MetaKeyModel.fromJson(Map<String, dynamic> json) =
      _$MetaKeyModelImpl.fromJson;

  @override
  String get namespace;
  @override
  String get app;
  @override
  String get path;
  @override
  String get kind;
  @override
  String get name;
  @override
  String? get id;

  /// Create a copy of MetaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaKeyModelImplCopyWith<_$MetaKeyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
