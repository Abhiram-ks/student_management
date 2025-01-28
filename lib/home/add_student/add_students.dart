import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_db_01/core/color/colors.dart';
import 'package:student_db_01/core/constant.dart';
import 'package:student_db_01/core/custom_snackbar.dart';
import 'package:student_db_01/db/db_helper.dart';
import 'package:student_db_01/db/model.dart';
import 'package:student_db_01/home/add_student/screen/custom_text.dart';
import 'package:student_db_01/home/add_student/screen/gender_selection.dart';
import 'package:student_db_01/home/add_student/screen/submit_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_db_01/home/add_student/screen/validation.dart';
import 'package:student_db_01/home/widget/appbar.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phonenoController = TextEditingController();
  File? _selectedImage;

  String _selectedGender = 'G';

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppbar(title: 'Student Information'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              hight30,
              Center(
                  child: GestureDetector(
                onTap: _pickImageFromGallery,
                child: ClipOval(
                  child: Container(
                      height: screenHeight * 0.15,
                      width: screenHeight * 0.15,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                        shape: BoxShape.circle,
                      ),
                      child: _selectedImage != null
                          ? ClipOval(
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                width: screenHeight * 0.15,
                                height: screenHeight * 0.15,
                              ),
                            )
                          : Lottie.asset(
                              'assets/addimage.json',
                              fit: BoxFit.contain,
                              width: screenHeight * 0.25,
                              height: screenHeight * 0.25,
                            )),
                ),
              )),
              hight10,
              CustomTextFormFild(
                icon: Icons.person,
                labelText: 'Name',
                hintText: 'Enter student name',
                controller: nameController,
                validate: NameValidator.validate,
              ),
              PhoneNumberFiled(
                icon: Icons.cake,
                labelText: 'Age',
                hintText: 'Enter student age',
                controller: ageController,
                validate: AgeValidator.validate,
              ),
              PhoneNumberFiled(
                icon: Icons.phone,
                labelText: 'Phone Number',
                hintText: 'Enter Phone Number',
                controller: phonenoController,
                validate: PhoneNumberValidator.validate,
              ),
              hight10,
              Text('            Select Gender'),
              GenderSelection(
                  selectedGender: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  }),
              SizedBox(
                height: 130,
              ),
              ActionButtons(
                onCancelPressed: () {
                  Navigator.pop(context);
                },
                onSubmitPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_selectedImage == null) {
                      CustomSnackBarCustomisation.show(
                        context: context,
                        message: 'Pick Image and process',
                        messageColor: blue,
                        icon: Icons.photo_size_select_large_rounded,
                        iconColor: blue,
                      );
                      return;
                    }

                    final student = StudentsModel(
                      name: nameController.text,
                      gender: _selectedGender,
                      phoneno: phonenoController.text,
                      age: ageController.text,
                      imageurl: _selectedImage?.path,
                    );
                    print(
                        "Student data: ${student.name}, ${student.gender}, ${student.phoneno}, ${student.age}, ${student.imageurl}");

                    await addStudent(student);

                    CustomSnackBarCustomisation.show(
                      // ignore: use_build_context_synchronously
                      context: context,
                      message: 'Data added Successfully',
                      messageColor: Colors.green,
                      icon: Icons.cloud_done,
                      iconColor: green,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    nameController.clear();
                    phonenoController.clear();
                    ageController.clear();
                    setState(() {
                      _selectedImage = null;
                      _selectedGender = 'G';
                    });
                  }
                },
                cancelText: 'Cancel',
                submitText: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
