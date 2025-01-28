
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_db_01/core/constant.dart';

import '../../../core/color/colors.dart';

class CustomTextFormFild extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String hintText;
  final String? Function(String? value) validate;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormFild({
    super.key,
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hight10,
        Row(
          children: [
           Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              width: 50,
              height: 60,
              child: Icon(
                icon,
                size: 30,
                color: black,
              ),
            ),
            Expanded(child: 
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                validator: validate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:InputDecoration(
                  enabledBorder: UnderlineInputBorder( borderSide: const BorderSide(color: grey)),
                  labelStyle: TextStyle(color: black),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color:red)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:blue)),
                  hintStyle: TextStyle(color:grey ),
                  labelText: labelText,
                  hintText: hintText,
                ) ,
              ),
            ))
          ],
        ),
      ],
    );
  }
}

class PhoneNumberFiled extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String hintText;
  final String? Function(String? value) validate;
  final bool obscureText;
  final TextEditingController controller;

  const PhoneNumberFiled({
    super.key,
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hight10,
        Row(
          children: [
           Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              width: 50,
              height: 60,
              child: Icon(
                icon,
                size: 30,
                color: black,
              ),
            ),
            Expanded(child: 
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                validator: validate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:InputDecoration(
                  enabledBorder: UnderlineInputBorder( borderSide: const BorderSide(color: grey)),
                  labelStyle: TextStyle(color: black),
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color:red)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:blue)),
                  hintStyle: TextStyle(color:grey ),
                   
                  labelText: labelText,
                  hintText: hintText,
                ) ,
                keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
              ),
            ))
          ],
        ),
      ],
    );
  }
}