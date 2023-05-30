class UserModel{
  final Map<String,dynamic> fullnames;
  final String email;
  final String idNumber;
  final String phoneNumber;

  UserModel({required this.fullnames, required this.email, required this.idNumber,
    required this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullnames: json['fullnames'] as Map<String, dynamic>,
      email: json['email'] as String,
      idNumber: json['idNumber'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullnames'] = fullnames;
    data['email'] = email;
    data['idNumber'] = idNumber;
    data['phoneNumber'] = phoneNumber;

    return data;
  }

}