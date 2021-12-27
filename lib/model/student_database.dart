import 'package:hive/hive.dart';
part 'student_database.g.dart';


@HiveType(typeId: 5)
class DataModel {
  @HiveField(2)
  late String name;
  @HiveField(3)
  late double age;
  @HiveField(4)
  late String school;
  @HiveField(5)
  late double height;
  DataModel({required this.name,required this.age,required this.height,required this.school});
}