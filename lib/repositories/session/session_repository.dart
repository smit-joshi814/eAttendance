import 'package:e_attendance/utility/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SessionRepository {
  static SessionRepository get instance => Get.find();

  Future<String> startSession(String? selectedCourse, String? selectedSubject,
      String? selectedSem, String? selectedDivision, int facultyId) async {
    final response = await http.get(Uri.parse(
        "$apiUrl/attendance/session/start/$selectedCourse/$selectedSubject/$selectedSem/$selectedDivision/$facultyId"));
    if (response.statusCode == 200) {
      String result = response.body;
      return result;
    } else {
      throw Exception('Failed to Start Session');
    }
  }

  Future<String> stopSession(String? selectedCourse, String? selectedSubject,
      String? selectedSem, String? selectedDivision, int facultyId) async {
    final response = await http.get(Uri.parse(
        "$apiUrl/attendance/session/stop/$selectedCourse/$selectedSubject/$selectedSem/$selectedDivision/$facultyId"));
    if (response.statusCode == 200) {
      String result = response.body;
      return result;
    } else {
      throw Exception('Failed to Stop Session');
    }
  }
}
