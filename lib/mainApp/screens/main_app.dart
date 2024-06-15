import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/fetchBloc/fetch_course_level_bloc.dart';
import '../bloc/fetchBloc/fetch_my_course_bloc.dart';
import 'dashboard/dashboard.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    context.read<FetchMyCourseBloc>().add(FetchMyCourse());
    context.read<FetchCourseLevelBloc>().add(FetchCourseLevel());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
