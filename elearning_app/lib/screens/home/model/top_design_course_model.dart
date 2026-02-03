class TopDesignCourseModel {
  final int id;
  final String title;
  final String price;

  TopDesignCourseModel({
    required this.id,
    required this.title,
    required this.price,
  });

  factory TopDesignCourseModel.fromJson(Map<String, dynamic> json) {
    return TopDesignCourseModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
    );
  }
}
