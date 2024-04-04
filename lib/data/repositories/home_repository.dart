import 'package:bloc_architecture/data/api/api.dart';
import 'package:bloc_architecture/data/api/api_routes.dart';
import 'package:bloc_architecture/data/models/coin.dart';
import 'package:bloc_architecture/data/models/resp.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  // Api instance
  final _api = Api();

  /// Get coins
  Future<Resp<List<Coin>>> getCoins(int page) async {
    try {
      final response = await _api.dio.get(ApiRoutes.getCoins, queryParameters: {'offset': page});
      return Resp(data: response.data['data'].map<Coin>((e) => Coin.fromMap(e)).toList());
    } on DioException catch (e) {
      return Resp(error: e.message ?? 'Error');
    } catch (e) {
      return Resp(error: e.toString());
    }
  }
}
