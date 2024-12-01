import 'dart:convert';
import 'package:buncode_task/features/posts/data/models/comment_model.dart';
import 'package:buncode_task/features/posts/data/models/post_model.dart';
import 'package:buncode_task/features/posts/domain/entities/comment_entity.dart';
import 'package:buncode_task/features/posts/domain/entities/post_entity.dart';
import 'package:buncode_task/features/posts/domain/repositories/post_repository.dart';
import 'package:http/http.dart' as http;

class PostRepositoryImpl implements PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  @override
  Future<List<PostEntity>> getPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => PostModel.fromJson(e).toEntity()).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<PostModel> getPostDetails(int postId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$postId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PostModel.fromJson(data);
    } else {
      throw Exception('Failed to load post details');
    }
  }

  @override
  Future<List<CommentEntity>> getCommentsByPostId(int postId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/comments?postId=$postId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((e) => CommentModel.fromJson(e))
          .toList()
          .cast<CommentEntity>();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
