import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class RoundedDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  RoundedDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 17, 41, 1),
          ),
        ),
        Container(
          width: 250, // Set the width as per your preference
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 36, 80, 7), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  value: value,
                  items: items,
                  onChanged: onChanged,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HomeState extends State<Home> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  String? selectedCourse;
  String? selectedDivision;
  String? selectedClass;
  String? selectedSubject;

  List<DropdownMenuItem<String>> courses = [
    DropdownMenuItem(child: Text('Course 1'), value: 'course_1'),
    DropdownMenuItem(child: Text('Course 2'), value: 'course_2'),
    DropdownMenuItem(child: Text('Course 3'), value: 'course_3'),
  ];

  List<DropdownMenuItem<String>> div = [
    DropdownMenuItem(child: Text('Division 1'), value: 'div_1'),
    DropdownMenuItem(child: Text('Division 2'), value: 'div_2'),
    DropdownMenuItem(child: Text('Division 3'), value: 'div_3'),
  ];

  List<DropdownMenuItem<String>> classes = [
    DropdownMenuItem(child: Text('Class 1'), value: 'class_1'),
    DropdownMenuItem(child: Text('Class 2'), value: 'class_2'),
    DropdownMenuItem(child: Text('Class 3'), value: 'class_3'),
  ];

  List<DropdownMenuItem<String>> subjects = [
    DropdownMenuItem(child: Text('Subject 1'), value: 'subject_1'),
    DropdownMenuItem(child: Text('Subject 2'), value: 'subject_2'),
    DropdownMenuItem(child: Text('Subject 3'), value: 'subject_3'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            width: 250,
            child: RoundedDropdown(
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
          SizedBox(height: 20),
          Container(
            width: 250,
            child: RoundedDropdown(
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
          SizedBox(height: 20),
          Container(
            width: 250,
            child: RoundedDropdown(
              label: 'Select Class:',
              value: selectedClass,
              items: classes,
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 250,
            ),
            child: RoundedDropdown(
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

          SizedBox(height: 40),
          // FilledButton.icon

          FilledButton.icon(
            label: const Text('Start Session'),
            icon: const Icon(Icons.wifi),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
