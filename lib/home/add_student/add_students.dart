import 'package:flutter/material.dart';
import 'package:student_db_01/core/color/colors.dart';
import 'package:student_db_01/core/constant.dart';
import 'package:student_db_01/home/add_student/screen/custom_text.dart';
import 'package:student_db_01/home/add_student/screen/gender_selection.dart';
import 'package:student_db_01/home/widget/appbar.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  String _selectedGender = 'G';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppbar(title: 'Student Information'),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 14.0),
       child: ListView(
        children: [
          hight30,
           Center(
            child:ClipRRect(
               borderRadius: BorderRadius.circular(100),
               child: Container(
                color:black,
                height: 120,
                width: 120,
                child: const Center(
                  child: Icon(
                    Icons.person_add,
                    color: white,
                    size: 45,
                  ),
                ),
               ),
            ) ,
           ),
          hight10,
          CustomTextFormFild(icon: Icons.person, labelText: 'Name', hintText: 'Enter your name'),hight10,
          Text('            Select Gender'),
          GenderSelection(selectedGender: _selectedGender, 
          onChanged: (value){
            setState(() {
              _selectedGender = value!;
            });
          }),
          CustomTextFormFild(icon: Icons.phone, labelText: 'Phone Number', hintText: 'Enter your Phone Number'),
          CustomTextFormFild(icon: Icons.cake, labelText: 'Age', hintText: 'Enter your age'),
        ],
       ),
     ),
     
    );
  }
}


