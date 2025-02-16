// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserPerfs {
  final String jwt;
  final int billID;

  UserPerfs({
    required this.jwt,
    required this.billID,
  });

  UserPerfs copyWith({
    String? jwt,
    int? billID,
  }) {
    return UserPerfs(
      jwt: jwt ?? this.jwt,
      billID: billID ?? this.billID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwt': jwt,
      'billID': billID,
    };
  }

  factory UserPerfs.fromMap(Map<String, dynamic> map) {
    return UserPerfs(
      jwt: map['jwt'] as String,
      billID: map['billID'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPerfs.fromJson(String source) =>
      UserPerfs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserPerfs(jwt: $jwt, billID: $billID)';

  @override
  bool operator ==(covariant UserPerfs other) {
    if (identical(this, other)) return true;

    return other.jwt == jwt && other.billID == billID;
  }

  @override
  int get hashCode => jwt.hashCode ^ billID.hashCode;
}
