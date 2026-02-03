import '../models/course_model.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CourseModel> _items = [];

  List<CourseModel> get items => _items;

  void addToCart(CourseModel course) {
    if (!_items.any((c) => c.id == course.id)) {
      _items.add(course);
    }
  }

  void removeFromCart(String id) {
    _items.removeWhere((c) => c.id == id);
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);
}
