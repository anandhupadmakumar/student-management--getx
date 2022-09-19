import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/view/screens/add_student_screen/add_student.dart';

import '../widgets/home/show_bottom_sheet.dart';

class StudentSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(
              context,
              null,
            );
          } else {
            query = ' ';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      hintColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 9, 151, 240),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          context,
          null,
        );
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

// search element
  @override
  Widget buildSuggestions(BuildContext context) {
    final searched = controller.list
        .where(
          (element) => element.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 38, 38),
      body: searched.isEmpty
          ? const Center(
              child: Text(
                "No Search Result !",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 151, 240),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          maxRadius: 30,

                          backgroundImage:
                              FileImage(File(searched[index].image)),
                          // backgroundImage: AssetImage(
                          //   widget.allAudios[index].metas.image!.path,
                          // ),

                          //AssetImage(audioList[index].metas.image!.path),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 41, 41, 41)
                                      .withOpacity(0.3),
                                  spreadRadius: 8,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        onTap: () async {
                          Get.bottomSheet(BottomSheetWidgets(
                            index: index,
                          ));
                        },
                        title: Padding(
                          padding: const EdgeInsets.only(
                            left: 5.0,
                            bottom: 3,
                            top: 3,
                          ),
                          child: Text(
                            controller.list[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: searched.length),
            ),
    );
  }
}
