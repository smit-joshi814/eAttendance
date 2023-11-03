import 'dart:convert';

class Faculty {
  int facultyId;
  String facultyEnrollment;
  String facultyEmail;
  String facultyName;
  String facultyPassword;

  Faculty({
    required this.facultyId,
    required this.facultyEnrollment,
    required this.facultyEmail,
    required this.facultyName,
    required this.facultyPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'facultyId': facultyId,
      'facultyEnrollment': facultyEnrollment,
      'facultyEmail': facultyEmail,
      'facultyName': facultyName,
      'facultyPassword': facultyPassword,
    };
  }

  factory Faculty.fromMap(Map<String, dynamic> map) {
    return Faculty(
      facultyId: map['facultyId'] as int,
      facultyEnrollment: map['facultyEnrollment'] as String,
      facultyEmail: map['facultyEmail'] as String,
      facultyName: map['facultyName'] as String,
      facultyPassword: map['facultyPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Faculty.fromJson(String source) =>
      Faculty.fromMap(json.decode(source) as Map<String, dynamic>);
}
