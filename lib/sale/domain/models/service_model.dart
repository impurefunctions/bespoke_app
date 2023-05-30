class ServiceModel{

  ServiceModel({required this.serviceName, required this.description,
    required this.fees, required this.durationDue});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceName: json['serviceName'] as String,
      description: json['description'] as String,
      fees: json['fees'].cast<Map<String,dynamic>>() as List<Map<String,dynamic>>,
      durationDue: json['durationDue'] as Map<String,dynamic>,
    );
  }
  final String serviceName;
  final String description;
  final List<Map<String,dynamic>> fees;
  final Map<String,dynamic> durationDue;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceName'] = serviceName;
    data['description'] = description;
    data['fees'] = fees;
    data['durationDue'] = durationDue;

    return data;
  }
}