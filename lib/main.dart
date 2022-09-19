import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_getx/view/screens/splash_screen/splash_screen.dart';

import 'model/student_model.dart';

late Box<StudentModel> studentDb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(StudentModelAdapter());
  studentDb = await Hive.openBox<StudentModel>('studen_details_db');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }
}
