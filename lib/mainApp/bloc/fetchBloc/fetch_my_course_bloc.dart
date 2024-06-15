import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings/api_services.dart';
import '../../models/course_model.dart';

// Bloc implementation
class FetchMyCourseBloc extends Bloc<FetchMyCourseEvent, FetchMyCourseState> {
  FetchMyCourseBloc() : super(FetchMyCourseInitial()) {
    on<FetchMyCourse>((event, emit) async {
      emit(FetchMyCourseProgress());
      if (kDebugMode) debugPrint("FetchMyCourseBloc started");
      var client = http.Client();
      try {
        final response = await client.get(
          Uri.parse('${ApiService.baseUrl}/my_course?auth_token=${ApiService.authToken}'),
        );
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status'] == 1) {
            var subjects = jsonResponse['data']['subjects'];

            List<CourseModel> courseList = subjects.map<CourseModel>((json) => CourseModel.fromJson(json)).toList();
            emit(FetchMyCourseSuccess(dataList: courseList));
          } else {
            emit(FetchMyCourseFailure('Failed to fetch data. Message: ${jsonResponse['message']}'));
          }
        } else {
          emit(FetchMyCourseFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(FetchMyCourseFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchMyCourseEvent {}

class FetchMyCourse extends FetchMyCourseEvent {}

/// Define states
abstract class FetchMyCourseState {}

class FetchMyCourseInitial extends FetchMyCourseState {}

class FetchMyCourseProgress extends FetchMyCourseState {}

class FetchMyCourseSuccess extends FetchMyCourseState {
  final List<CourseModel> dataList;

  FetchMyCourseSuccess({required this.dataList});
}

class FetchMyCourseFailure extends FetchMyCourseState {
  final String error;

  FetchMyCourseFailure(this.error);
}
