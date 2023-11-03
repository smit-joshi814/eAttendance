import 'package:e_attendance/utility/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  PreferredSizeWidget customAppBar({title = appName}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
    );
  }
}
