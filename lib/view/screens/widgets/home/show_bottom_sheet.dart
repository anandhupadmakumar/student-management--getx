import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/getx_controller.dart';

import 'show_student_details.dart';

class BottomSheetWidgets extends StatelessWidget {
  const BottomSheetWidgets({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentGetxController>(
        init: StudentGetxController(),
        builder: (data) {
          return BottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              onClosing: (() {}),
              builder: (ctx) {
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CircleAvatar(
                        backgroundImage:
                            FileImage(File(data.list[index].image)),
                        radius: MediaQuery.of(context).size.width * 0.15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ShowStudentDetails(),
                        const SizedBox(
                          width: 100,
                        ),
                        ShowStudentDetails(
                          name: data.list[index].name,
                          branch: data.list[index].branch,
                          age: data.list[index].age,
                          year: data.list[index].year,
                        )
                      ],
                    )
                  ],
                );
              });
        });
  }
}
