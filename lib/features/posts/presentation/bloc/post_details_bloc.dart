import 'package:buncode_task/features/posts/domain/entities/comment_entity.dart';
import 'package:buncode_task/features/posts/domain/entities/post_entity.dart';
import 'package:buncode_task/features/posts/domain/usecases/get_post_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PostDetailsEvent {}

class FetchPostDetailsEvent extends PostDetailsEvent {
  final int postId;

  FetchPostDetailsEvent(this.postId);
}

abstract class PostDetailsState {}

class PostDetailsInitial extends PostDetailsState {}

class PostDetailsLoading extends PostDetailsState {}

class PostDetailsLoaded extends PostDetailsState {
  final PostEntity post;
  final List<CommentEntity> comments;

  PostDetailsLoaded(this.post, this.comments);
}

class PostDetailsError extends PostDetailsState {
  final String message;

  PostDetailsError(this.message);
}

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final GetPostDetailsUseCase getPostDetailsUseCase;

  PostDetailsBloc(this.getPostDetailsUseCase) : super(PostDetailsInitial()) {
    on<FetchPostDetailsEvent>((event, emit) async {
      emit(PostDetailsLoading());
      try {
        final result = await getPostDetailsUseCase(event.postId);
        emit(PostDetailsLoaded(result['post'], result['comments']));
      } catch (e) {
        emit(PostDetailsError(e.toString()));
      }
    });
  }
}
