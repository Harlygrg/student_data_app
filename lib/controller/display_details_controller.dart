import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:new_studentapp/main.dart';
import 'package:new_studentapp/model/student_database.dart';
class DisplayDetailsController extends GetxController{
  List keysNew =[];
  bool fetching = true;

  late Box<DataModel> dataModelBox;
  @override
  void onInit() {
    // TODO: implement onInit
    dataModelBox =Hive.box<DataModel>(studentBoxName);
    keysNew = dataModelBox.keys.cast<int>().toList();
    super.onInit();
  }

}