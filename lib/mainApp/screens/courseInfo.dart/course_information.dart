import 'package:flutter/material.dart';
import 'package:task/mainApp/reusables/colors.dart';
import 'package:task/mainApp/reusables/sized_box.dart';

import '../../models/course_model.dart';
import '../../reusables/navigators.dart';

class CourseInformations extends StatelessWidget {
  final CourseModel course;
  const CourseInformations({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: const BoxDecoration(gradient: primaryGradient),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      removeScreen(context);
                    },
                    icon: const Icon(
                      size: 20,
                      color: white,
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Text(
                    course.title,
                    style: const TextStyle(color: white, fontSize: 20),
                  ),
                  hw10,
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
