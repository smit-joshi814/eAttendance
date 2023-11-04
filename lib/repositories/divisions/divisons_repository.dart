import 'dart:convert';

import 'package:e_attendance/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DivisionsRepository {
  static DivisionsRepository get instance => Get.find();

  Future<List<String>> getDivisons() async {
    final response = await http.get(Uri.parse("$apiUrl/student/getDivisons"));
    if (response.statusCode == 200) {
      List<String> divisions = jsonDecode(response.body);

      return divisions;
    } else {
      throw Exception('Failed to load Divisions');
    }
  }

  Future<List<DropdownMenuItem<String>>> getDivisionDropdownItems() async {
    List<String> divisions =
        await getDivisons(); // Assuming getDivisions returns a List of String
    List<DropdownMenuItem<String>> divisionItems = divisions
        .map((division) => DropdownMenuItem<String>(
              value: division,
              child: Text(division),
            ))
        .toList();

    return divisionItems;
  }
}
