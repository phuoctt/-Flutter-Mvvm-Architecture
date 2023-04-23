
import '../data/network/network_service.dart';

class AuthRepository {
  final NetworkService _apiServices = NetworkService();

  Future<dynamic> login(dynamic data) async {
    try {
      final response = await _apiServices.postApiResponse();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
