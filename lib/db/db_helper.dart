import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:student_db_01/db/model.dart';
late Database _db;

Future<void> initializeDatabase() async {
  _db = await openDatabase(
    "student.db",
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT, phoneno TEXT, age TEXT, imageurl TEXT);");
    },
  );
}

//*Create
Future<void> addStudent(StudentsModel value) async {
  try {
    await _db.rawInsert(
        "INSERT INTO student (name, gender, phoneno, age, imageurl) VALUES (?, ?, ?, ?, ?)",
        [value.name, value.gender, value.phoneno, value.age, value.imageurl]);
    log("Student add Successfully");
  } catch (e) {
    log("Error adding Student: $e");
  }
}

//*Update
Future<void> updateStudent(StudentsModel updateStudent) async {
  await _db.update(
    'student',
    {
      'name': updateStudent.name,
      'gender': updateStudent.gender,
      'phoneno': updateStudent.phoneno,
      'age': updateStudent.age,
      'imageurl': updateStudent.imageurl
    },
    where: 'id = ?',
    whereArgs: [updateStudent.id],
  );
}

Future<List<Map<String, dynamic>>> getAllStudents() async {
  final value = await _db.rawQuery("SELECT * FROM student");
  return value;
}

Future<void> deleteStudent(int id) async {
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
}
