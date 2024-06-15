import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/mainApp/reusables/colors.dart';
import 'package:task/mainApp/reusables/loading_screen.dart';
import 'package:task/mainApp/reusables/navigators.dart';

import '../../bloc/fetchBloc/fetch_my_course_bloc.dart';
import '../../constants/lists/app_list_constants.dart';
import '../../models/course_model.dart';
import '../../reusables/data_not_found.dart';
import '../../reusables/globals.dart';
import '../courseInfo.dart/course_information.dart';
import 'dashboard_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMyCourseBloc, FetchMyCourseState>(
      builder: (context, fmc) {
        if (fmc is FetchMyCourseProgress) {
          return const LoadingScreen(message: "Loading...");
        }
        if (fmc is FetchMyCourseSuccess) {
          debugPrint("data: ${fmc.dataList.toString()}");
        }
        return fmc is FetchMyCourseSuccess
            ? DashboardBody(
                courses: fmc.dataList,
              )
            : const NoData();
      },
    );
  }
}

class DashboardBody extends StatelessWidget {
  final List<CourseModel> courses;
  const DashboardBody({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardCard(
                course: "course",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      cardClr.length,
                      (index) => SmallCard(
                        bgClr: cardClr[index],
                        imgUrl: imgUrl[index],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Courses"),
                    Text(
                      "See All",
                      style: TextStyle(color: secondaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      courses.length,
                      (index) => InkWell(
                        onTap: () {
                          GlobalNotifier globalNotifier = GlobalNotifier();
                          globalNotifier.courseId.value = courses[index].courseId;
                          globalNotifier.sectionId.value = courses[index].levelId;
                          pushSimple(
                            context,
                            CourseInformations(course: courses[index]),
                          );
                        },
                        child: CourseCard(
                          bgClr: cardClr[index],
                          title: courses[index].title,
                          imgUrl: courseImgUrl[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
