import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mainApp/bloc/fetchBloc/fetch_course_level_bloc.dart';
import 'mainApp/bloc/fetchBloc/fetch_my_course_bloc.dart';
import 'mainApp/constants/strings/app_constants.dart';
import 'mainApp/screens/main_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchMyCourseBloc()),
        BlocProvider(create: (context) => FetchCourseLevelBloc()),
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Jost',
          brightness: Brightness.light,
        ),
        home: const MainApp(),
      ),
    );
  }
}
