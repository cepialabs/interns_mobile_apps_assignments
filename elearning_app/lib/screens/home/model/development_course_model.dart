class DevelopmentCourseModel {
  final int id;
  final String title;
  final String subtitle;
  final bool isBestSeller;
  final String thumbnail;

  DevelopmentCourseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isBestSeller,
    required this.thumbnail,
  });

  factory DevelopmentCourseModel.fromJson(Map<String, dynamic> json) {
    return DevelopmentCourseModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      isBestSeller: json['isBestSeller'] ?? false,
      thumbnail: json['thumbnail'],
    );
  }
}
