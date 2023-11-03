import 'package:e_attendance/screens/attendance_report/attendance_report.dart';
import 'package:e_attendance/screens/home/home_screen.dart';
import 'package:e_attendance/screens/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'components/drawer_navigation.dart';
import 'components/custom_appbar.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> currentScreen = [
      const Home(),
      const ExpertList(),
      const UserProfileScreen(),
    ];

    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: CustomAppBar().customAppBar(),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          color: Colors.greenAccent.withOpacity(0.1),
          child: currentScreen[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'Home',
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf),
            label: 'Attendance Report',
            tooltip: 'Attendance Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
