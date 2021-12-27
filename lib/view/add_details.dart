
import 'package:flutter/material.dart';
import 'package:new_studentapp/controller/add_details_controller.dart';
import 'package:new_studentapp/model/student_database.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'home1.dart';
var addDetailsController = Get.put(AddDetailsController());


class AddDetails extends StatelessWidget {
  const AddDetails({Key? key}) : super(key: key);


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
                    child: TextFormField(key: addDetailsController.formKey,
                      controller: addDetailsController.nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    controller: addDetailsController.ageController,keyboardType: TextInputType.number,
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
                    controller: addDetailsController.schoolController,keyboardType: TextInputType.text,
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
                    controller: addDetailsController.heightController,
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
                        final String newName = addDetailsController.nameController.text;
                        final String newSchool = addDetailsController.schoolController.text;
                        final double newAge = double.parse(addDetailsController.ageController.text);
                        final double newHeight =double.parse( addDetailsController.heightController.text);

                        if(addDetailsController.nameController.text.isEmpty || addDetailsController.ageController.text.isEmpty || addDetailsController.schoolController.text.isEmpty || addDetailsController.heightController.text.isEmpty ){
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
                          DataModel dataLocal =   DataModel(
                              name: newName,
                              age: newAge,
                              school: newSchool,
                              height: newHeight);
                          addDetailsController.dataModelBox2.add(dataLocal);
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
