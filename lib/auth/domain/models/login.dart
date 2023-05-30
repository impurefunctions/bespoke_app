import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(explicitToJson: true)

class Login {
  final String email, password, device_name;
  Login({required this.email, required this.password, required this.device_name});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}