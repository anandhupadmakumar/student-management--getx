import 'package:hive_flutter/hive_flutter.dart';

part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;
  @HiveField(3)
  final String age;
  @HiveField(4)
  final String branch;
  @HiveField(5)
  final String year;

  StudentModel(
      {required this.name,
      required this.image,
      required this.age,
      required this.branch,
      required this.year,
      this.id});
}
