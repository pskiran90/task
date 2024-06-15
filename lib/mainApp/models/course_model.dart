class CourseList {
  List<CourseModel> classRooms;

  CourseList.fromJson(List<dynamic> json) : classRooms = json.map((e) => CourseModel.fromJson(e)).toList();
}

class CourseModel {
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

  CourseModel({
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
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
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
    );
  }

  @override
  String toString() {
    return 'CourseModel{id: $id, title: $title, courseId: $courseId, levelId: $levelId, '
        'order: $order, thumbnail: $thumbnail, background: $background, '
        'icon: $icon, free: $free, instructorId: $instructorId}';
  }
}
