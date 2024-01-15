import 'package:volkhov_maps_app/models/post.dart';
import 'package:volkhov_maps_app/network/api_client.dart';
import 'package:volkhov_maps_app/utils/logger.dart';

import '../models/models.dart';

const String postsPath = '/posts';
const String stationslist = '/stations.json';
const String walletData = '/wallet-info';

class ApiService {
  late ApiClient _apiClient;

  ApiService(String apiDomain) {
    _apiClient = ApiClient(apiDomain: apiDomain);
  }

  /// Example HTTP request usage with params:
  ///       final res = await _apiClient.get('/comments', params: {
  ///         'postId': '1',
  ///       });
  Future<List<PostModel>> fetchPostsData() async {
    try {
      final res = await _apiClient.get(postsPath);
      return List<PostModel>.from(res.map((k) => PostModel.fromJson(k)));
    } catch (e) {
      log.severe('fetchPostsData error: $e');
      rethrow;
    }
  }

  Future<PostModel> publishPostData(String jsonBody) async {
    try {
      final response = await _apiClient.post(postsPath, jsonBody);
      return PostModel.fromJson(response);
    } catch (e) {
      log.severe('publishPostData error: $e');
      rethrow;
    }
  }

  Future<List<ChargestationsModel>> fetchChargestations() async {
    try {
      final response = await _apiClient.get(stationslist);
      return List<ChargestationsModel>.from(
          response.map((element) => ChargestationsModel.fromJson(element)));
    } catch (e) {
      log.severe('chargestationsData error: $e');
      rethrow;
    }
  }

  Future<WalletModel> fetchWalletData() async {
    try {
      final response = await _apiClient.get(walletData);
      return WalletModel.fromJson(response);
    } catch (e) {
      log.severe('WalletData error: $e');
      rethrow;
    }
  }
}
