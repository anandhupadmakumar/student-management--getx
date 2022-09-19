import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_getx/main.dart';
import 'package:student_getx/model/student_model.dart';
import 'package:student_getx/view/screens/add_student_screen/add_student.dart';

class StudentGetxController extends GetxController {
  @override
  void onReady() {
    list.clear();
    list.addAll(studentDb.values);
    update();

    super.onReady();
  }

  String? pickedImage;
  String? pickedimagefromGallery;
  var list = <StudentModel>[];

  getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);

    pickedimagefromGallery = images!.path;
    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (images == null) {
      print('aaaa');
    }
    pickedimagefromGallery = images!.path;

    update();
  }

  addStudentList(StudentModel data) async {
    final id = await studentDb.add(data);
    final idData = StudentModel(
        id: id,
        name: data.name,
        age: data.age,
        branch: data.branch,
        year: data.year,
        image: data.image);
    await studentDb.put(id, idData);

    list.add(idData);

    update();
    log(id.toString());
    log(list.toList().toString());
    log(data.age);
  }

  deleteStudent(int id, int index) {
    studentDb.delete(id);
    list.removeAt(index);
    update();
    print(index.toString());
  }

  updateStudent(StudentModel editStudent, int index) async {
    await studentDb.put(controller.list[index].id, editStudent);
    list.removeAt(index);
    list.insert(index, editStudent);
    update();
  }
}
