import 'dart:convert';

class Course {
  int courseId;
  String courseName;
  Course({
    required this.courseId,
    required this.courseName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'courseName': courseName,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'] as int,
      courseName: map['courseName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
