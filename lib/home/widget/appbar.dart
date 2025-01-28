import 'package:flutter/material.dart';
import 'package:student_db_01/core/color/colors.dart';


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: black, fontSize: 23),
      ),
      backgroundColor: white,
      iconTheme: const IconThemeData(color:black),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
