import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:io' show Directory;

import 'package:flutter/material.dart';
import 'package:new_studentapp/dataManipulation/student_database.dart';
import 'package:new_studentapp/widgets/home1.dart';
import 'package:new_studentapp/widgets/display_details.dart';
import 'package:new_studentapp/widgets/edit_details.dart';
import 'package:new_studentapp/widgets/add_details.dart';
import 'package:path_provider/path_provider.dart';
const studentBoxName ="studentBox";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>(studentBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fltter database learning',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          backgroundColor: Colors.white60
      ),
      home: Home(),
    );
  }
}