import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()

class Auth{
  Auth(this.refreshToken, this.accessToken);

  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'access_token')
  final String accessToken;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}