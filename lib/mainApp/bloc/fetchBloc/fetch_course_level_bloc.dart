import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../models/course_level_model.dart';
import '../../constants/strings/api_services.dart';
import '../../reusables/globals.dart';

// Bloc implementation
class FetchCourseLevelBloc extends Bloc<FetchCourseLevelEvent, FetchCourseLevelState> {
  FetchCourseLevelBloc() : super(FetchCourseLevelInitial()) {
    GlobalNotifier globalNotifier = GlobalNotifier();

    on<FetchCourseLevel>((event, emit) async {
      emit(FetchCourseLevelProgress());
      if (kDebugMode) debugPrint("FetchCourseLevelBloc started");
      var client = http.Client();
      try {
        final String courseId = globalNotifier.courseId.value;
        final String sectionId = globalNotifier.sectionId.value;

        final response = await client.get(
          Uri.parse('${ApiService.baseUrl}/levels_by_course?course_id=$courseId&section_id=$sectionId&auth_token=${ApiService.authToken}'),
        );
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status'] == 1) {
            List<dynamic> data = jsonResponse['data'];

            List<LevelModel> courseList = data.map<LevelModel>((json) => LevelModel.fromJson(json)).toList();
            emit(FetchCourseLevelSuccess(dataList: courseList));
          } else {
            emit(FetchCourseLevelFailure('Failed to fetch data. Message: ${jsonResponse['message']}'));
          }
        } else {
          emit(FetchCourseLevelFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(FetchCourseLevelFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchCourseLevelEvent {}

class FetchCourseLevel extends FetchCourseLevelEvent {}

/// Define states
abstract class FetchCourseLevelState {}

class FetchCourseLevelInitial extends FetchCourseLevelState {}

class FetchCourseLevelProgress extends FetchCourseLevelState {}

class FetchCourseLevelSuccess extends FetchCourseLevelState {
  final List<LevelModel> dataList;

  FetchCourseLevelSuccess({required this.dataList});
}

class FetchCourseLevelFailure extends FetchCourseLevelState {
  final String error;

  FetchCourseLevelFailure(this.error);
}
