import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_studentapp/dataManipulation/student_database.dart';
import 'package:flutter/material.dart';
import 'package:new_studentapp/widgets/home1.dart';
import 'package:new_studentapp/widgets/display_details.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:path/path.dart';
import 'package:new_studentapp/dataManipulation/student_database.dart';

import '../main.dart';

class AddDetails extends StatefulWidget {
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  List datas =[];
  bool fetching = true;
  //late Student handler;
  late Box<DataModel> dataModelBox2;
  @override
  void initState() {
    // TODO: implement initState
    dataModelBox2 =Hive.box<DataModel>(studentBoxName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Add New Student Details"),
    ),
      body:  Padding(padding: EdgeInsets.all(20),
        child: SingleChildScrollView(

          child: Form(

              child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(key: _formKey,
                  controller: nameController,autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter Student Name';
                    }
                    return null;
                  },
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),

                ),
              ),
              Divider(thickness: 15,color:  Colors.white60,),

              TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: ageController,keyboardType: TextInputType.number,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Age",
                ),
                validator: (value){
                  if(value == null || value.isEmpty){

                    return 'Please Enter Age';
                  }
                  return null;
                },
              ),
              Divider(thickness: 15,color:  Colors.white60,),

              TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: schoolController,keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "School",

                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter School';
                  }
                  return null;
                },
              ),
              Divider(thickness: 15,color:  Colors.white60,),

              TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Height",
                ),
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
                    final String newName = nameController.text;
                    final String newSchool = schoolController.text;
                    final double newAge = double.parse(ageController.text);
                    final double newHeight =double.parse( heightController.text);

                    if(nameController.text.isEmpty || ageController.text.isEmpty || schoolController.text.isEmpty || heightController.text.isEmpty ){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            // Retrieve the text the user has entered by using the
                            // TextEditingController.
                            content: Text("All fields are required",style: TextStyle(color: Colors.red),),
                          );
                        },
                      );

                    }
                   else{
                      //print("-----------??????????????----------------");

                      DataModel dataLocal =   DataModel(
                          name: newName,
                          age: newAge,
                          school: newSchool,
                          height: newHeight);
                      dataModelBox2.add(dataLocal);
                      print("-----------??????????????----------------");
                      setState(() {
                        datas.add(dataLocal);
                      });

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>Home()));
                    }
                  },
                      child: Text("Save Details",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400))),

                  VerticalDivider(thickness: 10,color:  Colors.white60,),



                  ElevatedButton(onPressed: (){
                          Navigator.pop(context);

                  },
                      child: Text("Discard",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                                )),
                ],
              )
            ],
          )),
        ),),

    );
  }
  
}
