import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(explicitToJson: true)

class AuthModel {

  AuthModel({
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  final String token;
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}