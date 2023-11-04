import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Semester {
  int semesterId;
  String semesterName;
  Semester({
    required this.semesterId,
    required this.semesterName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'semesterId': semesterId,
      'semesterName': semesterName,
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      semesterId: map['semesterId'] as int,
      semesterName: map['semesterName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      semesterId: json['semesterId'],
      semesterName: json['semesterName'],
    );
  }
}
