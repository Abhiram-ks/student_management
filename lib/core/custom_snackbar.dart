import 'package:flutter/material.dart';
import 'package:student_db_01/core/color/colors.dart';

class CustomSnackBarCustomisation {
  static void show({
    required BuildContext context,
    required String message,
    required Color messageColor,
    required IconData icon,
    required Color iconColor,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                message,
                style: TextStyle(color: messageColor),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            Icon(
              icon,
              color: iconColor,
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        backgroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: white, width: 1),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
