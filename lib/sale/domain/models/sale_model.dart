// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SaleModel {
  String? s;
  int? n;
  SaleModel({
    this.s,
    this.n,
  });

  SaleModel copyWith({
    String? s,
    int? n,
  }) {
    return SaleModel(
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

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) => SaleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SaleModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SaleModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
