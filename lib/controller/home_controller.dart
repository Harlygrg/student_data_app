import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:new_studentapp/main.dart';
import 'package:new_studentapp/model/student_database.dart';

class HomeController extends GetxController{
 //List<DataModel> students =[].obs ;
 late Box<DataModel> dataModelBoxNew;
 @override
  void onInit() {
    // TODO: implement onInit
  dataModelBoxNew =Hive.box<DataModel>(studentBoxName);
    super.onInit();
  }
 late List<int> keys;
 List<int> count(){
  keys = dataModelBoxNew.keys.cast<int>().toList();
  return keys;
 }
}