import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/getx_controller.dart';
import 'package:student_getx/view/screens/add_student_screen/add_student.dart';

import '../../../model/student_model.dart';
import '../widgets/add_student/image_taking_bottom_sheet.dart';

// ignore: must_be_immutable
class EditStudentScreen extends StatelessWidget {
  EditStudentScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  final _nameController1 = TextEditingController();

  final _ageController = TextEditingController();
  final _branchController = TextEditingController();
  final _yearController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    print('ssssss');

    _nameController1.text = controller.list[index].name;
    _ageController.text = controller.list[index].age;
    _branchController.text = controller.list[index].branch;
    _yearController.text = controller.list[index].year;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit student'),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GetBuilder<StudentGetxController>(
                  init: StudentGetxController(),
                  builder: (data) {
                    return CircleAvatar(
                      backgroundImage: controller.pickedimagefromGallery == null
                          ? FileImage(File(data.list[index].image))
                          : FileImage(File(data.pickedimagefromGallery!)),
                      radius: 100,
                      child: IconButton(
                        onPressed: () {
                          Get.bottomSheet(ImageTakingWidget());
                        },
                        icon: const Icon(Icons.add_photo_alternate_outlined),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _nameController1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _branchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    editButtonListner(context);
                  },
                  child: const Text('update')),
            ),
          ],
        )));
  }

  Future<void> editButtonListner(ctx) async {
    final imagefile =
        controller.pickedimagefromGallery ?? controller.list[index].image;
    final branch = _branchController.text;
    final name = _nameController1.text;
    final age = _ageController.text;
    final year = _yearController.text;
    if (name.isEmpty || age.isEmpty || branch.isEmpty || year.isEmpty) {
      Get.snackbar('Error', 'image and all fields are required',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.black);
    } else {
      final editStudent = StudentModel(
          id: controller.list[index].id,
          name: name,
          image: imagefile,
          age: age,
          branch: branch,
          year: year);
      Get.snackbar('✅', 'Added successfull',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.green,
          backgroundColor: Colors.black);
      controller.updateStudent(editStudent, index);

      _nameController1.clear();
      _ageController.clear();
      _branchController.clear();
      _yearController.clear();
    }
  }
}
