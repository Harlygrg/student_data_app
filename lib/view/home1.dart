
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_studentapp/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'add_details.dart';
import 'display_details.dart';
var homeContoller = Get.put(HomeController());
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students List"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child:SizedBox(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
          child: ValueListenableBuilder(
            valueListenable: homeContoller.dataModelBoxNew.listenable(),
            builder: (context,_,value){
              List<int> keys;
              List<int> count(){
                keys =  homeContoller.dataModelBoxNew.keys.cast<int>().toList();
                return keys;
              }
              return count().isEmpty ? Center(child:Text("Add Student Details") ,):
              ListView.builder(
                  itemCount: count().length,
                  itemBuilder: (context,index){
                    final int key =count()[index];
                    final studentDetails = homeContoller.dataModelBoxNew.get(key);
                    return GestureDetector(onTap: (){
                      int num =index;
                      print("________________________");
                      print(num);
                      Get.to(DisplayDetails(index:key));
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayDetails(index:key)));
                    },
                      child: ListTile(title: Text(studentDetails!.name,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),tileColor: Colors.white30,
                        trailing: ClipRRect(child: Image.asset("images/dummy.png"),
                          borderRadius: BorderRadius.all(Radius.circular(30)),),),
                    );
                  });
            },
          ),
        ),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("--------------hi===========");
          // Navigator.push(context,
          //     MaterialPageRoute(
          //         builder: (context)=>AddDetails()));
          Get.to(AddDetails());

        },
        child: Icon(Icons.add),),
    );
  }
}

