import 'faculty_model.dart';
import 'semester_model.dart';
import 'subject_model.dart';

class Mapping {
  int mapId;
  Course course;
  Subject subject;
  Semester semester;
  Faculty faculty;

  Mapping({
    required this.mapId,
    required this.course,
    required this.subject,
    required this.semester,
    required this.faculty,
  });

  factory Mapping.fromJson(Map<String, dynamic> json) {
    return Mapping(
      mapId: json['mapId'] as int,
      course: Course.fromJson(json['course']),
      subject: Subject.fromJson(json['subject']),
      semester: Semester.fromJson(json['semester']),
      faculty: Faculty.fromJson(json['faculty']),
    );
  }
}

class Course {
  String courseId;
  // Other properties and constructor

  Course({
    required this.courseId,
    // Other constructor parameters
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['courseId'] as String,
      // Initialize other properties from the JSON map
    );
  }
}
