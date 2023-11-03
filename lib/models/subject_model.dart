import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Subject {
  int subjectId;
  String subjectName;
  Subject({
    required this.subjectId,
    required this.subjectName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectId': subjectId,
      'subjectName': subjectName,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      subjectId: map['subjectId'] as int,
      subjectName: map['subjectName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source) as Map<String, dynamic>);
}
