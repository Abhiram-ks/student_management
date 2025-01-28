import 'package:flutter/material.dart';
import 'package:student_db_01/core/color/colors.dart';
import 'package:student_db_01/home/add_student/add_students.dart';
import 'package:student_db_01/home/widget/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Students Management'),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudents(),));
      },
      backgroundColor: black,
      child: const Icon(
        Icons.person_add,
        color: white,
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}