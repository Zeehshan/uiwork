// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) {
  return _MetaModel.fromJson(json);
}

/// @nodoc
mixin _$MetaModel {
  String get metaid => throw _privateConstructorUsedError;
  int? get metasize => throw _privateConstructorUsedError;
  String? get metatext => throw _privateConstructorUsedError;
  @TimeStamptoDateConverter()
  DateTime get metatime => throw _privateConstructorUsedError;
  String? get metatype => throw _privateConstructorUsedError;
  String? get participant => throw _privateConstructorUsedError;
  ViewCatModel? get viewcat => throw _privateConstructorUsedError;
  String? get gtext => throw _privateConstructorUsedError;
  String? get gtype => throw _privateConstructorUsedError;
  String? get dtime => throw _privateConstructorUsedError;
  String? get rtime => throw _privateConstructorUsedError;
  String? get metalength => throw _privateConstructorUsedError;
  @JsonKey(name: '__key__')
  MetaKeyModel? get metaKey => throw _privateConstructorUsedError;
  MetafileModel? get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaModelCopyWith<MetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaModelCopyWith<$Res> {
  factory $MetaModelCopyWith(MetaModel value, $Res Function(MetaModel) then) =
      _$MetaModelCopyWithImpl<$Res, MetaModel>;
  @useResult
  $Res call(
      {String metaid,
      int? metasize,
      String? metatext,
      @TimeStamptoDateConverter() DateTime metatime,
      String? metatype,
      String? participant,
      ViewCatModel? viewcat,
      String? gtext,
      String? gtype,
      String? dtime,
      String? rtime,
      String? metalength,
      @JsonKey(name: '__key__') MetaKeyModel? metaKey,
      MetafileModel? file});

  $ViewCatModelCopyWith<$Res>? get viewcat;
  $MetaKeyModelCopyWith<$Res>? get metaKey;
  $MetafileModelCopyWith<$Res>? get file;
}

/// @nodoc
class _$MetaModelCopyWithImpl<$Res, $Val extends MetaModel>
    implements $MetaModelCopyWith<$Res> {
  _$MetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metaid = null,
    Object? metasize = freezed,
    Object? metatext = freezed,
    Object? metatime = null,
    Object? metatype = freezed,
    Object? participant = freezed,
    Object? viewcat = freezed,
    Object? gtext = freezed,
    Object? gtype = freezed,
    Object? dtime = freezed,
    Object? rtime = freezed,
    Object? metalength = freezed,
    Object? metaKey = freezed,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      metaid: null == metaid
          ? _value.metaid
          : metaid // ignore: cast_nullable_to_non_nullable
              as String,
      metasize: freezed == metasize
          ? _value.metasize
          : metasize // ignore: cast_nullable_to_non_nullable
              as int?,
      metatext: freezed == metatext
          ? _value.metatext
          : metatext // ignore: cast_nullable_to_non_nullable
              as String?,
      metatime: null == metatime
          ? _value.metatime
          : metatime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metatype: freezed == metatype
          ? _value.metatype
          : metatype // ignore: cast_nullable_to_non_nullable
              as String?,
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as String?,
      viewcat: freezed == viewcat
          ? _value.viewcat
          : viewcat // ignore: cast_nullable_to_non_nullable
              as ViewCatModel?,
      gtext: freezed == gtext
          ? _value.gtext
          : gtext // ignore: cast_nullable_to_non_nullable
              as String?,
      gtype: freezed == gtype
          ? _value.gtype
          : gtype // ignore: cast_nullable_to_non_nullable
              as String?,
      dtime: freezed == dtime
          ? _value.dtime
          : dtime // ignore: cast_nullable_to_non_nullable
              as String?,
      rtime: freezed == rtime
          ? _value.rtime
          : rtime // ignore: cast_nullable_to_non_nullable
              as String?,
      metalength: freezed == metalength
          ? _value.metalength
          : metalength // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKey: freezed == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as MetaKeyModel?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MetafileModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewCatModelCopyWith<$Res>? get viewcat {
    if (_value.viewcat == null) {
      return null;
    }

    return $ViewCatModelCopyWith<$Res>(_value.viewcat!, (value) {
      return _then(_value.copyWith(viewcat: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaKeyModelCopyWith<$Res>? get metaKey {
    if (_value.metaKey == null) {
      return null;
    }

    return $MetaKeyModelCopyWith<$Res>(_value.metaKey!, (value) {
      return _then(_value.copyWith(metaKey: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetafileModelCopyWith<$Res>? get file {
    if (_value.file == null) {
      return null;
    }

    return $MetafileModelCopyWith<$Res>(_value.file!, (value) {
      return _then(_value.copyWith(file: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaModelImplCopyWith<$Res>
    implements $MetaModelCopyWith<$Res> {
  factory _$$MetaModelImplCopyWith(
          _$MetaModelImpl value, $Res Function(_$MetaModelImpl) then) =
      __$$MetaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String metaid,
      int? metasize,
      String? metatext,
      @TimeStamptoDateConverter() DateTime metatime,
      String? metatype,
      String? participant,
      ViewCatModel? viewcat,
      String? gtext,
      String? gtype,
      String? dtime,
      String? rtime,
      String? metalength,
      @JsonKey(name: '__key__') MetaKeyModel? metaKey,
      MetafileModel? file});

  @override
  $ViewCatModelCopyWith<$Res>? get viewcat;
  @override
  $MetaKeyModelCopyWith<$Res>? get metaKey;
  @override
  $MetafileModelCopyWith<$Res>? get file;
}

/// @nodoc
class __$$MetaModelImplCopyWithImpl<$Res>
    extends _$MetaModelCopyWithImpl<$Res, _$MetaModelImpl>
    implements _$$MetaModelImplCopyWith<$Res> {
  __$$MetaModelImplCopyWithImpl(
      _$MetaModelImpl _value, $Res Function(_$MetaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metaid = null,
    Object? metasize = freezed,
    Object? metatext = freezed,
    Object? metatime = null,
    Object? metatype = freezed,
    Object? participant = freezed,
    Object? viewcat = freezed,
    Object? gtext = freezed,
    Object? gtype = freezed,
    Object? dtime = freezed,
    Object? rtime = freezed,
    Object? metalength = freezed,
    Object? metaKey = freezed,
    Object? file = freezed,
  }) {
    return _then(_$MetaModelImpl(
      metaid: null == metaid
          ? _value.metaid
          : metaid // ignore: cast_nullable_to_non_nullable
              as String,
      metasize: freezed == metasize
          ? _value.metasize
          : metasize // ignore: cast_nullable_to_non_nullable
              as int?,
      metatext: freezed == metatext
          ? _value.metatext
          : metatext // ignore: cast_nullable_to_non_nullable
              as String?,
      metatime: null == metatime
          ? _value.metatime
          : metatime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metatype: freezed == metatype
          ? _value.metatype
          : metatype // ignore: cast_nullable_to_non_nullable
              as String?,
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as String?,
      viewcat: freezed == viewcat
          ? _value.viewcat
          : viewcat // ignore: cast_nullable_to_non_nullable
              as ViewCatModel?,
      gtext: freezed == gtext
          ? _value.gtext
          : gtext // ignore: cast_nullable_to_non_nullable
              as String?,
      gtype: freezed == gtype
          ? _value.gtype
          : gtype // ignore: cast_nullable_to_non_nullable
              as String?,
      dtime: freezed == dtime
          ? _value.dtime
          : dtime // ignore: cast_nullable_to_non_nullable
              as String?,
      rtime: freezed == rtime
          ? _value.rtime
          : rtime // ignore: cast_nullable_to_non_nullable
              as String?,
      metalength: freezed == metalength
          ? _value.metalength
          : metalength // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKey: freezed == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as MetaKeyModel?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MetafileModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaModelImpl implements _MetaModel {
  const _$MetaModelImpl(
      {required this.metaid,
      required this.metasize,
      required this.metatext,
      @TimeStamptoDateConverter() required this.metatime,
      required this.metatype,
      required this.participant,
      required this.viewcat,
      required this.gtext,
      required this.gtype,
      required this.dtime,
      required this.rtime,
      required this.metalength,
      @JsonKey(name: '__key__') this.metaKey,
      required this.file});

  factory _$MetaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaModelImplFromJson(json);

  @override
  final String metaid;
  @override
  final int? metasize;
  @override
  final String? metatext;
  @override
  @TimeStamptoDateConverter()
  final DateTime metatime;
  @override
  final String? metatype;
  @override
  final String? participant;
  @override
  final ViewCatModel? viewcat;
  @override
  final String? gtext;
  @override
  final String? gtype;
  @override
  final String? dtime;
  @override
  final String? rtime;
  @override
  final String? metalength;
  @override
  @JsonKey(name: '__key__')
  final MetaKeyModel? metaKey;
  @override
  final MetafileModel? file;

  @override
  String toString() {
    return 'MetaModel(metaid: $metaid, metasize: $metasize, metatext: $metatext, metatime: $metatime, metatype: $metatype, participant: $participant, viewcat: $viewcat, gtext: $gtext, gtype: $gtype, dtime: $dtime, rtime: $rtime, metalength: $metalength, metaKey: $metaKey, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaModelImpl &&
            (identical(other.metaid, metaid) || other.metaid == metaid) &&
            (identical(other.metasize, metasize) ||
                other.metasize == metasize) &&
            (identical(other.metatext, metatext) ||
                other.metatext == metatext) &&
            (identical(other.metatime, metatime) ||
                other.metatime == metatime) &&
            (identical(other.metatype, metatype) ||
                other.metatype == metatype) &&
            (identical(other.participant, participant) ||
                other.participant == participant) &&
            (identical(other.viewcat, viewcat) || other.viewcat == viewcat) &&
            (identical(other.gtext, gtext) || other.gtext == gtext) &&
            (identical(other.gtype, gtype) || other.gtype == gtype) &&
            (identical(other.dtime, dtime) || other.dtime == dtime) &&
            (identical(other.rtime, rtime) || other.rtime == rtime) &&
            (identical(other.metalength, metalength) ||
                other.metalength == metalength) &&
            (identical(other.metaKey, metaKey) || other.metaKey == metaKey) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metaid,
      metasize,
      metatext,
      metatime,
      metatype,
      participant,
      viewcat,
      gtext,
      gtype,
      dtime,
      rtime,
      metalength,
      metaKey,
      file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaModelImplCopyWith<_$MetaModelImpl> get copyWith =>
      __$$MetaModelImplCopyWithImpl<_$MetaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaModelImplToJson(
      this,
    );
  }
}

abstract class _MetaModel implements MetaModel {
  const factory _MetaModel(
      {required final String metaid,
      required final int? metasize,
      required final String? metatext,
      @TimeStamptoDateConverter() required final DateTime metatime,
      required final String? metatype,
      required final String? participant,
      required final ViewCatModel? viewcat,
      required final String? gtext,
      required final String? gtype,
      required final String? dtime,
      required final String? rtime,
      required final String? metalength,
      @JsonKey(name: '__key__') final MetaKeyModel? metaKey,
      required final MetafileModel? file}) = _$MetaModelImpl;

  factory _MetaModel.fromJson(Map<String, dynamic> json) =
      _$MetaModelImpl.fromJson;

  @override
  String get metaid;
  @override
  int? get metasize;
  @override
  String? get metatext;
  @override
  @TimeStamptoDateConverter()
  DateTime get metatime;
  @override
  String? get metatype;
  @override
  String? get participant;
  @override
  ViewCatModel? get viewcat;
  @override
  String? get gtext;
  @override
  String? get gtype;
  @override
  String? get dtime;
  @override
  String? get rtime;
  @override
  String? get metalength;
  @override
  @JsonKey(name: '__key__')
  MetaKeyModel? get metaKey;
  @override
  MetafileModel? get file;
  @override
  @JsonKey(ignore: true)
  _$$MetaModelImplCopyWith<_$MetaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
