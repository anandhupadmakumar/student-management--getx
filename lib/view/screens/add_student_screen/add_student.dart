import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/getx_controller.dart';

import '../../../model/student_model.dart';
import '../widgets/add_student/image_taking_bottom_sheet.dart';
import '../widgets/edit_student/edit_form_field.dart';
  final controller = Get.put(StudentGetxController());

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();
  final _branchController = TextEditingController();
  final _yearController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add student'),
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
                      backgroundImage: data.pickedimagefromGallery == null
                          ? const AssetImage('assets/images/download.jpg')
                          : FileImage(File(data.pickedimagefromGallery!))
                              as ImageProvider,
                      backgroundColor: Colors.grey,
                      radius: MediaQuery.of(context).size.width * 0.25,
                      child: IconButton(
                        onPressed: () {
                          Get.bottomSheet(ImageTakingWidget());
                        },
                        icon: const Icon(Icons.add_photo_alternate_outlined),
                      ),
                    );
                  }),
            ),
            FormFieldWidget(
              controller: _nameController,
              name: 'Name',
            ),
            FormFieldWidget(
              controller: _ageController,
              name: 'Age',
            ),
            FormFieldWidget(
              controller: _branchController,
              name: 'Branch',
            ),
            FormFieldWidget(
              controller: _yearController,
              name: 'Year',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    addButtonListner(context);
                  },
                  child: const Text('Add')),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addButtonListner(ctx) async {
    final imagefile =
        controller.pickedimagefromGallery ?? 'assets/images/download.jpg';
    final branch = _branchController.text;
    final name = _nameController.text;
    final age = _ageController.text;
    final year = _yearController.text;
    if (imagefile == 'assets/images/download.jpg' ||
        name.isEmpty ||
        age.isEmpty ||
        branch.isEmpty ||
        year.isEmpty) {
      Get.snackbar('Error', 'image and all fields are required',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.black);
    } else {
      final student = StudentModel(
          name: name, image: imagefile, age: age, branch: branch, year: year);
      Get.snackbar('✅', 'Added successfull',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.green,
          backgroundColor: Colors.black);

      
      _nameController.clear();
      _ageController.clear();
      _branchController.clear();
      _yearController.clear();

      controller.addStudentList(student);
     
    }
  }
}
