
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_entity.freezed.dart';
part 'authentication_entity.g.dart';

@freezed
class AuthenticationEntity with _$AuthenticationEntity {
  factory AuthenticationEntity({
    String? token,
    @Default(false) bool isLogin
  }) = _AuthenticationEntity;
	
  factory AuthenticationEntity.fromJson(Map<String, dynamic> json) =>
			_$AuthenticationEntityFromJson(json);
}
