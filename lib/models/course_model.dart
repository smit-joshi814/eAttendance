// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  final int courseId;
  final String courseName;

  Course({
    required this.courseId,
    required this.courseName,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['courseId'],
      courseName: json['courseName'],
    );
  }

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
}

extension JsonConversion on Course {
  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'courseName': courseName,
    };
  }
}
