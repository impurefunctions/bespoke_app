// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainModel {
  String? s;
  int? n;
  MainModel({
    this.s,
    this.n,
  });

  MainModel copyWith({
    String? s,
    int? n,
  }) {
    return MainModel(
      s: s ?? this.s,
      n: n ?? this.n,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      's': s,
      'n': n,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) => MainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MainModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MainModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
