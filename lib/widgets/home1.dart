import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_studentapp/dataManipulation/student_database.dart';
import 'package:new_studentapp/widgets/add_details.dart';
// import 'package:new_studentapp/widgets/display_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:new_studentapp/dataManipulation/student_database.dart';
// import 'dart:async';
// import 'package:path/path.dart';

import '../main.dart';
import 'display_details.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<DataModel> dataModelBoxNew;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataModelBoxNew =Hive.box<DataModel>(studentBoxName);
  }
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
          valueListenable: dataModelBoxNew.listenable(),
            builder: (context, Box<DataModel> student,_){
                  List<String> name=[];
                  List<int> keys;
                  List<int> count(){
                    keys = student.keys.cast<int>().toList();
                    return keys;
                  }
              return count().isEmpty ? Center(child:Text("Add Student Details") ,):
              ListView.builder(
                itemCount: count().length,
                  itemBuilder: (context,index){
                  final int key =count()[index];
                    final studentDetails =student.get(key);
                    return GestureDetector(onTap: (){
                      int num =index;
                      print("________________________");
                      print(num);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayDetails(index:key)));
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
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context)=>AddDetails()));

        },
        child: Icon(Icons.add),),
    );
  }
}
