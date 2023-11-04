import 'dart:convert';

import 'package:e_attendance/utility/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AttendanceRepository {
  static AttendanceRepository get instance => Get.find();

  Future<String> markAttendance(String? selectedCourse, String? selectedSubject,
      String? selectedSem, String? selectedDivision, int facultyId) async {
    final response = await http.get(Uri.parse(
        "$apiUrl/attendance/add/$selectedCourse/$selectedSubject/$selectedSem/$selectedDivision"));
    if (response.statusCode == 200) {
      String result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception('Failed to load Batches');
    }
  }
}
