import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/getx_controller.dart';
import 'package:student_getx/view/screens/add_student_screen/add_student.dart';

import '../search/student_search.dart';
import '../widgets/home/home_card_list.dart';

class HomeScreenStudent extends StatelessWidget {
  HomeScreenStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('home value chekking${controller.list.toString()}');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Details '),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: StudentSearch());
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Get.to(() => AddStudentScreen());
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: SafeArea(
          child: GetBuilder<StudentGetxController>(
              init: StudentGetxController(),
              builder: (data) {
                log('home value check${data.list.toString()}');
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (ctx, index) {
                    return HomeCardListWidget(
                      index: index,
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 2,
                    );
                  },
                  itemCount: data.list.length,
                );
              }),
        ));
  }
}
