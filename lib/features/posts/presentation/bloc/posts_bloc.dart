import 'package:buncode_task/features/posts/domain/entities/post_entity.dart';
import 'package:buncode_task/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PostsEvent {}

class FetchPostsEvent extends PostsEvent {}

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostEntity> posts;

  PostsLoaded(this.posts);
}

class PostsError extends PostsState {
  final String message;

  PostsError(this.message);
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;

  PostsBloc(this.getPostsUseCase) : super(PostsInitial()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await getPostsUseCase();
        print('Fetched posts: $posts'); 
        emit(PostsLoaded(posts));
      } catch (e) {
        print('Error: $e'); 
        emit(PostsError(e.toString()));
      }
    });
  }
}
