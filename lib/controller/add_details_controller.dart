import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:new_studentapp/main.dart';
import 'package:new_studentapp/model/student_database.dart';

class AddDetailsController extends GetxController{
  late Box<DataModel> dataModelBox2;
  @override
  void onInit() {
    // TODO: implement onInit
    dataModelBox2 =Hive.box<DataModel>(studentBoxName);
    super.onInit();
  }
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  List datas =[];
  bool fetching = true;
  //late Student handler;


}