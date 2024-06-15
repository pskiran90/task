class LevelList {
  List<LevelModel> classRooms;

  LevelList.fromJson(List<dynamic> json) : classRooms = json.map((e) => LevelModel.fromJson(e)).toList();
}


class LevelModel {
  final String id;
  final String title;
  final String isLocked;
  final List<SectionModel> sections;

  LevelModel({
    required this.id,
    required this.title,
    required this.isLocked,
    required this.sections,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    var sectionList = json['sections'] as List;
    List<SectionModel> sections =
        sectionList.map((section) => SectionModel.fromJson(section)).toList();

    return LevelModel(
      id: json['id'],
      title: json['title'],
      isLocked: json['is_locked'],
      sections: sections,
    );
  }
}


class SectionModel {
  final String id;
  final String title;
  final String courseId;
  final String levelId;
  final String order;
  final String thumbnail;
  final String background;
  final String icon;
  final String free;
  final dynamic instructorId;
  final int isAttended;
  final int isCompleted;
  final int total;
  final String videoCount;
  final int completed;

  SectionModel({
    required this.id,
    required this.title,
    required this.courseId,
    required this.levelId,
    required this.order,
    required this.thumbnail,
    required this.background,
    required this.icon,
    required this.free,
    this.instructorId,
    required this.isAttended,
    required this.isCompleted,
    required this.total,
    required this.videoCount,
    required this.completed,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      levelId: json['level_id'],
      order: json['order'],
      thumbnail: json['thumbnail'],
      background: json['background'],
      icon: json['icon'],
      free: json['free'],
      instructorId: json['instructor_id'],
      isAttended: json['is_attended'],
      isCompleted: json['is_completed'],
      total: json['total'],
      videoCount: json['video_count'],
      completed: json['completed'],
    );
  }
}
