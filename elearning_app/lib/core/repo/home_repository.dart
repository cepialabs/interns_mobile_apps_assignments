import '../../screens/home/model/home_response_model.dart';
import '../services/home_api_service.dart';

class HomeRepository {
  final HomeApiService api;

  HomeRepository(this.api);

  Future<HomeResponseModel> getHomeData() async {
    final json = await api.fetchHomeJson();
    return HomeResponseModel.fromJson(json);
  }
}
