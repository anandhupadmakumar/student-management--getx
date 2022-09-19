import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const FormFieldWidget({
    required this.name,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
