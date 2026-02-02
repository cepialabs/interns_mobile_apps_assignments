class Course {
  final int id;
  final String title;
  final String image;
  final double rating;
  final double price;
  final String? students;
  final String? author;
  final bool isBestSeller;
  final List<int> categoryIds;
  final double progress;
  final bool isCertified;

  Course({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    this.students,
    this.author,
    required this.isBestSeller,
    required this.categoryIds,
    this.progress = 0.0,
    this.isCertified = false,
  });

  Course copyWith({double? progress}) {
    return Course(
      id: id,
      title: title,
      image: image,
      rating: rating,
      price: price,
      students: students,
      author: author,
      isBestSeller: isBestSeller,
      categoryIds: categoryIds,
      progress: progress ?? this.progress,
      isCertified: isCertified,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      students: json['students'],
      author: json['author'],
      isBestSeller: json['isBestSeller'] ?? false,
      categoryIds: List<int>.from(json['categoryIds'] ?? []),
      isCertified: json['isCertified'] ?? false,
    );
  }
}
