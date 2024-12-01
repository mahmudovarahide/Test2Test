
import 'package:buncode_task/features/posts/domain/repositories/post_repository.dart';

class GetPostDetailsUseCase {
  final PostRepository repository;

  GetPostDetailsUseCase(this.repository);

  Future<Map<String, dynamic>> call(int postId) async {
    final post = await repository.getPostDetails(postId);
    final comments = await repository.getCommentsByPostId(postId);

    return {
      'post': post,
      'comments': comments,
    };
  }
}
