import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/getx_controller.dart';

class ImageTakingWidget extends StatelessWidget {
  ImageTakingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (ctx) {
          return Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Get.find<StudentGetxController>().getGallery();
                      Get.back();

                      // log(controller.pickedimagefromGallery.toString());
                    },
                    icon: Icon(Icons.image),
                    iconSize: 30,
                    color: Color.fromARGB(255, 15, 187, 235)),
                IconButton(
                  onPressed: () {
                    Get.find<StudentGetxController>().getCamera();
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                  ),
                  iconSize: 30,
                  color: const Color.fromARGB(255, 15, 187, 235),
                ),
              ],
            ),
          );
        });
  }
}
