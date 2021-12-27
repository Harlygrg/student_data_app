import 'package:flutter/material.dart';
import 'package:new_studentapp/controller/display_details_controller.dart';
import 'edit_details.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
var dispDetContrlr = Get.put( DisplayDetailsController());
class DisplayDetails extends StatelessWidget {
  int index;
  DisplayDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Text("Student Details"),
      ),
      body: Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.7,
                child: Card(
                  elevation: 20,shadowColor: Colors.blueGrey,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.asset("images/dummy.png"),
                      ),
                      Divider(thickness: 15,color: Colors.white,),
                      Text("Name: ${dispDetContrlr.dataModelBox.get(index)!.name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Divider(thickness: 15,color: Colors.white,),
                      Text("Age: ${dispDetContrlr.dataModelBox.get(index)!.age}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      Divider(thickness: 15,color: Colors.white,),
                      Text("School: ${dispDetContrlr.dataModelBox.get(index)!.school}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                      Divider(thickness: 15,color: Colors.white,),
                      Text("Height: ${dispDetContrlr.dataModelBox.get(index)!.height}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top:20),
                  child: ElevatedButton(onPressed: (){
                    Get.to(EditDetails(
                      studentIndex: index,
                      studentName:dispDetContrlr.dataModelBox.get(index)!.name,
                      studentAge: dispDetContrlr.dataModelBox.get(index)!.age,
                      studentHeight: dispDetContrlr.dataModelBox.get(index)!.height,
                      studentSchool: dispDetContrlr.dataModelBox.get(index)!.school,));

                  },
                      child: Text("Edit details",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400)))),
              Padding(padding: EdgeInsets.only(top:20),
                  child: ElevatedButton(onPressed: (){
                    dispDetContrlr.dataModelBox.delete(index);
                    Navigator.pop(context);
                  },
                      child: Text("Delete",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w400)))),
            ],
          ),
        ),
      ),
    );
  }
}



