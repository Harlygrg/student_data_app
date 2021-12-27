import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_studentapp/dataManipulation/student_database.dart';
import 'package:new_studentapp/widgets/home1.dart';
import 'package:new_studentapp/widgets/display_details.dart';
import 'package:new_studentapp/widgets/add_details.dart';

import 'dart:async';
import 'package:path/path.dart';

import '../main.dart';


class EditDetails extends StatefulWidget {
  late int studentIndex;
  late String studentName;
  late double studentAge;
  late String studentSchool;
  late double studentHeight;
EditDetails({
  Key? key,
  required this.studentName,
  required this.studentAge,
  required this.studentSchool,
  required this.studentHeight,
  required this.studentIndex,
}) : super(key: key);
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  List keysEdit =[];
  late Box<DataModel> dataModelBox;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    dataModelBox =Hive.box<DataModel>(studentBoxName);
    keysEdit = dataModelBox.keys.cast<int>().toList();
    super.initState();
  }


    // values({int ?id}){
    //   String newName1=widget.studentName ;
    //   String  newSchool1 =widget.studentSchool;
    //   double newAge1 =widget.studentAge;
    //   double newHeight1=widget.studentHeight ;
    //   if(id==1){
    //     return newName1;
    //   }
    //   else if(id==2){
    //     return newSchool1;
    //   }
    //   else if(id==3){
    //     return newAge1;
    //   }
    //   else{
    //     return newHeight1;
    //   }
    // }
  String ?newName;
  String ? newSchool;
  double ?newAge ;
  double ?newHeight ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Edit Student Details"),
    ),
      body: Padding(padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(key: formKey,
            child: Column(
          children: [
            TextFormField(
                initialValue:widget.studentName ,
                decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Enter Student Name';
                }
                return null;
              },
              onChanged: (text){
                  newName=text;
              },
            ),
            Divider(thickness: 15,color:  Colors.white60,),

            TextFormField(
             initialValue: widget.studentAge.toString(),
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Age",
              ),
              onChanged: (age){
               newAge = double.parse(age);
              },
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Enter Age';
                }
                return null;
              },
            ),
            Divider(thickness: 15,color:  Colors.white60,),

            TextFormField(
             initialValue:widget.studentSchool ,keyboardType: TextInputType.text,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "School",

              ),
              onChanged: (school){
               newSchool =school;
              },
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Enter School';
                }
                return null;
              },
            ),
            Divider(thickness: 15,color:  Colors.white60,),

            TextFormField(
             initialValue: widget.studentHeight.toString(),
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Height",
              ),
              onChanged: (height){
               newHeight =double.parse(height);
              },
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Enter Height';
                }
                return null;
              },
            ),
            Divider(thickness: 15,color:  Colors.white60,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){

                  // final isValid = formKey.currentState!.validate();
                  // if( isValid){
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return const AlertDialog(
                  //         // Retrieve the text the user has entered by using the
                  //         // TextEditingController.
                  //         content: Text("All fields are required",style: TextStyle(color: Colors.red),),
                  //       );
                  //     },
                  //   );
                  //
                  // }
                  // else{
                  if(newAge ==null){
                    newAge =widget.studentAge;
                  }
                  if(newName ==null){
                    newName =widget.studentName;
                  }
                  if(newSchool ==null){
                    newSchool =widget.studentSchool;
                  }
                  if(newHeight ==null){
                    newHeight =widget.studentHeight;
                  }
                    DataModel _dataModel = DataModel(name:newName.toString() , age:newAge! , height: newHeight!, school: newSchool!);
                    dataModelBox.put(widget.studentIndex, _dataModel);
                  // }
                  Navigator.pop(context);
                },
                    child: Text("Save Details",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400))),
                VerticalDivider(thickness: 10,color:  Colors.white60,),
                ElevatedButton(onPressed: (){
                  dataModelBox.delete(widget.studentIndex);
                },
                    child:const Text("Delete",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400))),
              ],
            )
          ],
        )),
      ),),
    );
  }
}
