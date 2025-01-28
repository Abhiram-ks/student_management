
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/color/colors.dart';
import 'db/db_helper.dart';
import 'start/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
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