import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:new_studentapp/main.dart';
import 'package:new_studentapp/model/student_database.dart';

class EditDetailsController extends GetxController{

  List keysEdit =[];
  late Box<DataModel> dataModelBox;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit
    dataModelBox =Hive.box<DataModel>(studentBoxName);
    keysEdit = dataModelBox.keys.cast<int>().toList();
    super.onInit();
  }

  String ?newName;
  String ? newSchool;
  double ?newAge ;
  double ?newHeight ;

}