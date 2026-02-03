import 'dart:convert';
import 'package:flutter/services.dart';

class HomeApiService {
  Future<Map<String, dynamic>> fetchHomeJson() async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final jsonString = await rootBundle.loadString(
      'assets/json/home_response.json',
    );

    return json.decode(jsonString);
  }
}
