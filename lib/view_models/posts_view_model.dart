import 'package:flutter/material.dart';
import 'package:volkhov_maps_app/models/post.dart';
import 'package:volkhov_maps_app/network/response.dart';
import 'package:volkhov_maps_app/services/api_service.dart';
import 'package:volkhov_maps_app/utils/logger.dart';

class PostsViewModel extends ChangeNotifier {
  final ApiService _apiService;
  NetworkResponse<List<PostModel>> postsListResponse = NetworkResponse.none();
  NetworkResponse publishPostResponse = NetworkResponse.none();

  PostsViewModel(this._apiService);

  Future<void> fetchPosts() async {
    postsListResponse =
        NetworkResponse<List<PostModel>>.loading('Fetching posts...');
    notifyListeners();
    try {
      final postList = await _apiService.fetchPostsData();
      postsListResponse = NetworkResponse.completed(postList);
    } catch (e) {
      postsListResponse = NetworkResponse.error(e.toString());
      log.fine('fetchPosts error: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> publishPost(String title, String body, int userId) async {
    publishPostResponse = NetworkResponse.loading('Publishing post...');
    notifyListeners();
    try {
      final postList = await _apiService.publishPostData(body);
      publishPostResponse = NetworkResponse.completed(postList);
    } catch (e) {
      publishPostResponse = NetworkResponse.error(e.toString());
      log.severe('publishPost error: $e');
    } finally {
      notifyListeners();
    }
  }

  String get postsText {
    switch (postsListResponse.status) {
      case Status.completed:
        return '${postsListResponse.data!.length}';
      case Status.loading:
      case Status.error:
        return postsListResponse.message ?? '';
      case Status.none:
      default:
        return '';
    }
  }
}
