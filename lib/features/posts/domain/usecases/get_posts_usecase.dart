

import 'package:buncode_task/features/posts/domain/entities/post_entity.dart';
import 'package:buncode_task/features/posts/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<PostEntity>> call() async {
    final posts = await repository.getPosts();
    posts.sort((a, b) => a.id.compareTo(b.id)); 
    return posts;
  }
}
