import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeScreenDelay(context);

    return const Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
            child: Center(
          child: Text('splash screen'),
        )));
  }
}

Future<void> homeScreenDelay(context) async {
  await Future.delayed(const Duration(
    milliseconds: 3000,
  ));
  Get.offAll(()=>  HomeScreenStudent());
}
