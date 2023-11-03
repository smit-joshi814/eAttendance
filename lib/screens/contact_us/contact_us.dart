import 'package:e_attendance/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Contact Us",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                height: 200,
                width: 200,
                image: AssetImage(appLogo),
              ),
              const SizedBox(height: 30),
              buildContactInfo("Our toll-free number:", "816-052-4421"),
              const SizedBox(height: 20),
              buildContactInfo("Website:", "Smit Joshi"),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(
                      icon: Icons.phone,
                      iconColor: Colors.green,
                      onTap: () {
                        launchUrl(Uri.parse("tel: +91 8160524421"));
                      }),
                  const SizedBox(width: 20),
                  buildSocialIcon(
                      icon: Icons.web,
                      iconColor: Colors.blue,
                      onTap: () {
                        launchUrl(
                          Uri.parse("https://resumesmitjoshi.blogspot.com/"),
                          mode: LaunchMode.inAppWebView,
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildSocialIcon({icon, iconColor, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: iconColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
