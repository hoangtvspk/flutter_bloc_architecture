import 'package:bloc_architecture/core/models/base_response/base_response.dart';
import '../models/post/post.dart';
import '../services/home_service.dart';

class HomeRepository {
  final HomeService homeService;

  HomeRepository(this.homeService);

  Future<BaseResponse<List<Post>>> getPosts() async {
    try {
      final res = await homeService.getPosts();
      if (res == null) {
        throw Exception("Get posts failed");
      } else {
        List<Post> result = res.map((e) => Post.fromJson(e)).toList();
        return BaseResponse(data: result);
      }
    } catch (e) {
      return const BaseResponse(data: []);
    }
  }
}
