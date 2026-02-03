class UserModel {
  final String name;
  final String email;
  final int courses;
  final int certificates;
  final int learningHours;
  final String certificateTitle;
  final String completedDate;

  UserModel({
    required this.name,
    required this.email,
    required this.courses,
    required this.certificates,
    required this.learningHours,
    required this.certificateTitle,
    required this.completedDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      courses: json['courses'],
      certificates: json['certificates'],
      learningHours: json['learningHours'],
      certificateTitle: json['certificateTitle'],
      completedDate: json['completedDate'],
    );
  }
}
