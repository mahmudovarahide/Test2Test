import 'package:buncode_task/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required super.id, required super.title, required super.body}); 

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  PostEntity toEntity() {
    return PostEntity(id: this.id, title: this.title, body: this.body);
  }
}
