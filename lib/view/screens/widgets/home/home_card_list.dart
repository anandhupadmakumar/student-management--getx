import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/view/screens/edit_screen/edit_screen.dart';

import '../../../../controller/getx_controller.dart';
import 'show_bottom_sheet.dart';

class HomeCardListWidget extends StatelessWidget {
  final int index;

  HomeCardListWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 122, 142, 240),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color.fromARGB(255, 248, 246, 246),
      elevation: 6,
      child: GetBuilder<StudentGetxController>(
          init: StudentGetxController(),
          builder: (data) {
            return ListTile(
              onTap: () {
                Get.bottomSheet(BottomSheetWidgets(
                  index: index,
                ));
                // detail of one student
              },
              leading: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: FileImage(File(data.list[index].image)),
                ),
              ),
              title: Row(
                children: [
                  Text(data.list[index].name),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.to(() => EditStudentScreen(
                              index: index,
                            ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      )),
                  IconButton(
                      onPressed: () {
                        if (data.list[index].id == null) {
                          print('object');
                          return;
                        }
                        data.deleteStudent(data.list[index].id!, index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            );
          }),
    );
  }
}
