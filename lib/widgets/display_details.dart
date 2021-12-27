import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_studentapp/widgets/edit_details.dart';

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

import 'package:new_studentapp/dataManipulation/student_database.dart';

import '../main.dart';

class DisplayDetails extends StatefulWidget {
  int index;

  DisplayDetails({Key? key, required this.index}) : super(key: key);

  @override
  _DisplayDetailsState createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {

  List keysNew =[];
  bool fetching = true;

  late Box<DataModel> dataModelBox;
  @override
  void initState() {
    // TODO: implement initState
    dataModelBox =Hive.box<DataModel>(studentBoxName);
    keysNew = dataModelBox.keys.cast<int>().toList();
    super.initState();
  }
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
                    Text("Name: ${dataModelBox.get(widget.index)!.name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Divider(thickness: 15,color: Colors.white,),
                    Text("Age: ${dataModelBox.get(widget.index)!.age}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    Divider(thickness: 15,color: Colors.white,),
                    Text("School: ${dataModelBox.get(widget.index)!.school}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                    Divider(thickness: 15,color: Colors.white,),
                    Text("Height: ${dataModelBox.get(widget.index)!.height}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),

    Padding(padding: EdgeInsets.only(top:20),
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=>EditDetails(
                    studentIndex: widget.index,
                    studentName:dataModelBox.get(widget.index)!.name,
                studentAge: dataModelBox.get(widget.index)!.age,
                studentHeight: dataModelBox.get(widget.index)!.height,
                studentSchool: dataModelBox.get(widget.index)!.school,)));
          },
          child: Text("Edit details",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400)))),
            Padding(padding: EdgeInsets.only(top:20),
                child: ElevatedButton(onPressed: (){
                      dataModelBox.delete(widget.index);
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
