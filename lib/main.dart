import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'dart:io' show Directory;
import 'package:new_studentapp/view/home1.dart';
import 'package:path_provider/path_provider.dart';
import 'model/student_database.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fltter database learning',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          backgroundColor: Colors.white60
      ),
      home: const Home(),
    );
  }
}