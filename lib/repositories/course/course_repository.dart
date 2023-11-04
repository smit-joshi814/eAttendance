import 'dart:convert';
import 'package:e_attendance/models/course_model.dart';
import 'package:e_attendance/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  static CourseRepository get instance => Get.find();

  Future<List<Course>> getCourses() async {
    final response = await http.get(Uri.parse("$apiUrl/course/get"));

    if (response.statusCode == 200) {
      List<dynamic> courseList = jsonDecode(response.body);
      List<Course> courses =
          courseList.map((json) => Course.fromJson(json)).toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<List<DropdownMenuItem<String>>> getCoursesDropdownItems() async {
    List<Course> courses = await getCourses();
    return courses
        .map((course) => DropdownMenuItem(
              value: course.courseId
                  .toString(), // Assuming 'id' is the unique identifier for the course
              child: Text(course
                  .courseName), // Replace 'name' with the actual course name field
            ))
        .toList();
  }
}
