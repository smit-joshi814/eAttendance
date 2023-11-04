import 'dart:convert';

import 'package:e_attendance/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DivisionsRepository {
  static DivisionsRepository get instance => Get.find();

  Future<List<String>> getDivisons() async {
    final response = await http.get(Uri.parse("$apiUrl/student/getDivisions"));
    if (response.statusCode == 200) {
      List<dynamic> divisionList = jsonDecode(response.body);
      List<String> divisions = divisionList.map((dynamic division) {
        return division.toString();
      }).toList();

      return divisions;
    } else {
      throw Exception('Failed to load Divisions');
    }
  }

  Future<List<DropdownMenuItem<String>>> getDivisionDropdownItems() async {
    List<String> divisions =
        await getDivisons(); // Assuming getDivisions returns a List of String
    List<DropdownMenuItem<String>> divisionItems = [];

    for (String division in divisions) {
      divisionItems.add(DropdownMenuItem<String>(
        value: division,
        child: Text(division),
      ));
    }

    return divisionItems;
  }
}
