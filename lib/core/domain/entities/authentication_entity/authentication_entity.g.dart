// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationEntityImpl _$$AuthenticationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationEntityImpl(
      token: json['token'] as String?,
      isLogin: json['isLogin'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthenticationEntityImplToJson(
        _$AuthenticationEntityImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'isLogin': instance.isLogin,
    };
