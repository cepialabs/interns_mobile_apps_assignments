import 'home_data_model.dart';

class HomeResponseModel {
  final bool success;
  final String message;
  final HomeDataModel data;

  HomeResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      success: json['success'],
      message: json['message'],
      data: HomeDataModel.fromJson(json['data']),
    );
  }
}
