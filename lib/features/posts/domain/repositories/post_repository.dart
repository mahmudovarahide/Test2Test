

import 'package:buncode_task/features/posts/data/models/post_model.dart';
import 'package:buncode_task/features/posts/domain/entities/comment_entity.dart';
import 'package:buncode_task/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
  Future<PostModel> getPostDetails(int postId);
  Future<List<CommentEntity>> getCommentsByPostId(int postId);
}
