import 'package:e_attendance/repositories/session/session_repository.dart';
import 'package:e_attendance/repositories/course/course_repository.dart';
import 'package:e_attendance/repositories/divisions/divisons_repository.dart';
import 'package:e_attendance/repositories/semsster/semester_repository.dart';
import 'package:e_attendance/repositories/subject/subject_repository.dart';
import 'package:e_attendance/screens/components/dropdown_widget.dart';
import 'package:e_attendance/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repositories/auth/auth_repository.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthenticationRepository authRepo = Get.find();
  CourseRepository courseRepo = Get.put(CourseRepository());
  SubjectRepository subjectRepo = Get.put(SubjectRepository());
  SemesterRepository semRepo = Get.put(SemesterRepository());
  DivisionsRepository divrepo = Get.put(DivisionsRepository());
  SessionRepository sessionRepo = Get.put(SessionRepository());

  List<DropdownMenuItem<String>> courses = [];

  List<DropdownMenuItem<String>> div = [];

  List<DropdownMenuItem<String>> semesters = [];

  List<DropdownMenuItem<String>> subjects = [];

  String? selectedCourse;
  String? selectedDivision;
  String? selectedSem;
  String? selectedSubject;
  String? result;
  String? sessionText = "Start Session";
  bool isSession = false;

  @override
  void initState() {
    super.initState();

    selectedDivision = 'div_1';

    // Fetch and set courses data
    courseRepo.getCoursesDropdownItems().then((result) {
      setState(() {
        courses = result;
        selectedCourse = courses.first.value;
      });
    });

    subjectRepo.getSubjectsDropdownItems().then((value) {
      setState(() {
        subjects = value;
        selectedSubject = subjects.first.value;
      });
    });

    semRepo.getSemestersDropdownItems().then((value) {
      setState(() {
        semesters = value;
        selectedSem = semesters.first.value;
      });
    });

    divrepo.getDivisionDropdownItems().then((value) {
      setState(() {
        div = value;
        selectedDivision = div.first.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),

          SizedBox(
            width: 250,
            child: DropdownWidget(
              label: 'Select Course:',
              value: selectedCourse,
              items: courses,
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
            child: DropdownWidget(
              label: 'Select Subject:',
              value: selectedSubject,
              items: subjects,
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
            ),
          ),

          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: DropdownWidget(
              label: 'Select Semester:',
              value: selectedSem,
              items: semesters,
              onChanged: (value) {
                setState(() {
                  selectedSem = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: DropdownWidget(
              label: 'Select Division:',
              value: selectedDivision,
              items: div,
              onChanged: (value) {
                setState(() {
                  selectedDivision = value;
                });
              },
            ),
          ),

          const SizedBox(height: 40),
          // FilledButton.icon

          FilledButton.icon(
            label: Text(isSession ? 'Stop Session' : 'Start Session'),
            icon: const Icon(Icons.wifi),
            onPressed: () async {
              if (!isSession) {
                result = await sessionRepo.startSession(
                    selectedCourse,
                    selectedSubject,
                    selectedSem,
                    selectedDivision,
                    authRepo.faculty.value!.facultyId);
                setState(() {
                  result;
                  isSession = true;
                });
                showSnackkBar(
                    icon: const Icon(Icons.done), title: '', message: result);
              } else {
                result = await sessionRepo.stopSession(
                    selectedCourse,
                    selectedSubject,
                    selectedSem,
                    selectedDivision,
                    authRepo.faculty.value!.facultyId);
                setState(() {
                  result;
                  isSession = false;
                });
                showSnackkBar(
                    icon: const Icon(Icons.done), title: '', message: result);
              }
            },
          ),
        ],
      ),
    );
  }
}
