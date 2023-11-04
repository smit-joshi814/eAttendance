import 'dart:convert';

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

  String toJson() => json.encode({
        'subjectId': subjectId,
        'subjectName': subjectName,
      });

  factory Subject.fromJson(Map<String, dynamic> map) => Subject(
        subjectId: map['subjectId'] as int,
        subjectName: map['subjectName'] as String,
      );
}
