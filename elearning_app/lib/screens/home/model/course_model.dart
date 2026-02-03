class Course {
  final String title;
  final double? rating;
  final String? students;
  final String? price;
  final String? subtitle;
  final bool isBestSeller;

  Course({
    required this.title,
    this.rating,
    this.students,
    this.price,
    this.subtitle,
    this.isBestSeller = false,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      rating: json['rating']?.toDouble(),
      students: json['students'],
      price: json['price'],
      subtitle: json['subtitle'],
      isBestSeller: json['isBestSeller'] ?? false,
    );
  }
}
