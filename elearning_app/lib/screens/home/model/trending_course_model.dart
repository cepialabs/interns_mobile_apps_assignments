class TrendingCourseModel {
  final int id;
  final String title;
  final double rating;
  final String students;
  final String thumbnail;

  TrendingCourseModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.students,
    required this.thumbnail,
  });

  factory TrendingCourseModel.fromJson(Map<String, dynamic> json) {
    return TrendingCourseModel(
      id: json['id'],
      title: json['title'],
      rating: (json['rating'] as num).toDouble(),
      students: json['students'],
      thumbnail: json['thumbnail'],
    );
  }
}
