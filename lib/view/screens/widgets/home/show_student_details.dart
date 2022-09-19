import 'package:flutter/material.dart';

class ShowStudentDetails extends StatelessWidget {
  final String name;
  final String age;
  final String branch;
  final String year;

  const ShowStudentDetails({
    super.key,
     this.name='Name',
     this.age='Age',
     this.branch='Branch',
     this.year='Year',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            name,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
           branch,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
           age,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            year,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
