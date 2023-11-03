import 'package:e_attendance/utility/constants.dart';
import 'package:flutter/material.dart';
import '../../auth/auth_repository.dart';
import '../contact_us/about_us.dart';
import '../contact_us/contact_us.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Image(height: 100, width: 100, image: AssetImage(appLogo)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text(
              'About Us',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity, // Full width
            child: TextButton.icon(
              label: const Text('LogOut'),
              onPressed: () {
                AuthenticationRepository.instance.logOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
