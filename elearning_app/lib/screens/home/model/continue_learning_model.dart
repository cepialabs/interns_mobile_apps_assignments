class ContinueLearningModel {
  final int id;
  final String title;
  final String instructor;
  final int progress;
  final String lastLesson;
  final String thumbnail;

  ContinueLearningModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.progress,
    required this.lastLesson,
    required this.thumbnail,
  });

  factory ContinueLearningModel.fromJson(Map<String, dynamic> json) {
    return ContinueLearningModel(
      id: json['id'],
      title: json['title'],
      instructor: json['instructor'],
      progress: json['progress'],
      lastLesson: json['last_lesson'],
      thumbnail: json['thumbnail'],
    );
  }
}
