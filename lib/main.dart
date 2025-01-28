import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_db_01/core/color/colors.dart';
import 'package:student_db_01/start/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STUDENT DATABASE',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
       primarySwatch: primaryColor,
       scaffoldBackgroundColor: white,
       fontFamily: GoogleFonts.montserrat().fontFamily,
       textTheme: TextTheme(
        bodyLarge: TextStyle(color: black),
        bodyMedium: TextStyle(color:black),
        bodySmall: TextStyle(color:black), 
       )
      ),
      home: SplashScreen(),
    );
  }
}