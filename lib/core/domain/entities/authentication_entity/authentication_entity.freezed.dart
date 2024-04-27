// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationEntity _$AuthenticationEntityFromJson(Map<String, dynamic> json) {
  return _AuthenticationEntity.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationEntity {
  String? get token => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationEntityCopyWith<AuthenticationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEntityCopyWith<$Res> {
  factory $AuthenticationEntityCopyWith(AuthenticationEntity value,
          $Res Function(AuthenticationEntity) then) =
      _$AuthenticationEntityCopyWithImpl<$Res, AuthenticationEntity>;
  @useResult
  $Res call({String? token, bool isLogin});
}

/// @nodoc
class _$AuthenticationEntityCopyWithImpl<$Res,
        $Val extends AuthenticationEntity>
    implements $AuthenticationEntityCopyWith<$Res> {
  _$AuthenticationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? isLogin = null,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationEntityImplCopyWith<$Res>
    implements $AuthenticationEntityCopyWith<$Res> {
  factory _$$AuthenticationEntityImplCopyWith(_$AuthenticationEntityImpl value,
          $Res Function(_$AuthenticationEntityImpl) then) =
      __$$AuthenticationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, bool isLogin});
}

/// @nodoc
class __$$AuthenticationEntityImplCopyWithImpl<$Res>
    extends _$AuthenticationEntityCopyWithImpl<$Res, _$AuthenticationEntityImpl>
    implements _$$AuthenticationEntityImplCopyWith<$Res> {
  __$$AuthenticationEntityImplCopyWithImpl(_$AuthenticationEntityImpl _value,
      $Res Function(_$AuthenticationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? isLogin = null,
  }) {
    return _then(_$AuthenticationEntityImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationEntityImpl implements _AuthenticationEntity {
  _$AuthenticationEntityImpl({this.token, this.isLogin = false});

  factory _$AuthenticationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationEntityImplFromJson(json);

  @override
  final String? token;
  @override
  @JsonKey()
  final bool isLogin;

  @override
  String toString() {
    return 'AuthenticationEntity(token: $token, isLogin: $isLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationEntityImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, isLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationEntityImplCopyWith<_$AuthenticationEntityImpl>
      get copyWith =>
          __$$AuthenticationEntityImplCopyWithImpl<_$AuthenticationEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationEntityImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationEntity implements AuthenticationEntity {
  factory _AuthenticationEntity({final String? token, final bool isLogin}) =
      _$AuthenticationEntityImpl;

  factory _AuthenticationEntity.fromJson(Map<String, dynamic> json) =
      _$AuthenticationEntityImpl.fromJson;

  @override
  String? get token;
  @override
  bool get isLogin;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationEntityImplCopyWith<_$AuthenticationEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
