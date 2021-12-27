import 'package:flutter/material.dart';
import 'package:new_studentapp/controller/edit_details_controller.dart';
import 'package:new_studentapp/model/student_database.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

var editDetCntrlr = Get.put(EditDetailsController());
class EditDetails extends StatelessWidget {
  late int studentIndex;
  late String studentName;
  late double studentAge;
  late String studentSchool;
  late double studentHeight;
  EditDetails ({Key? key,
   required this.studentName,
   required this.studentAge,
   required this.studentSchool,
   required this.studentHeight,
   required this.studentIndex,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Edit Student Details"),
    ),
      body: Padding(padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(key: editDetCntrlr.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      initialValue:studentName ,
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
                        editDetCntrlr.newName=text;
                      },
                    ),
                  ),
                  Divider(thickness: 15,color:  Colors.white60,),

                  TextFormField(
                    initialValue: studentAge.toString(),
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Age",
                    ),
                    onChanged: (age){
                      editDetCntrlr.newAge = double.parse(age);
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
                    initialValue:studentSchool ,keyboardType: TextInputType.text,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "School",

                    ),
                    onChanged: (school){
                      editDetCntrlr.newSchool =school;
                    },
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter School';
                      }
                      return null;
                    },
                  ),
                  const Divider(thickness: 15,color:  Colors.white60,),

                  TextFormField(
                    initialValue: studentHeight.toString(),
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Height",
                    ),
                    onChanged: (height){
                      editDetCntrlr.newHeight =double.parse(height);
                    },
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Height';
                      }
                      return null;
                    },
                  ),
                  const Divider(thickness: 15,color:  Colors.white60,),
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
                        editDetCntrlr.newAge ??= studentAge;
                        editDetCntrlr.newName ??= studentName;
                        editDetCntrlr.newSchool ??= studentSchool;
                        editDetCntrlr.newHeight ??= studentHeight;
                        DataModel _dataModel = DataModel(
                            name:editDetCntrlr.newName.toString() ,
                            age:editDetCntrlr.newAge! ,
                            height: editDetCntrlr.newHeight!,
                            school: editDetCntrlr.newSchool!);
                        editDetCntrlr.dataModelBox.put(studentIndex, _dataModel);
                        // }
                        Navigator.pop(context);
                      },
                          child:const Text("Save Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400))),
                       const VerticalDivider(thickness: 10,color:  Colors.white60,),
                      ElevatedButton(onPressed: (){
                        editDetCntrlr.dataModelBox.delete(studentIndex);
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


