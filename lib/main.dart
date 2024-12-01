import 'package:buncode_task/core/router_generator.dart';
import 'package:buncode_task/features/posts/domain/repositories/post_repository.dart';
import 'package:buncode_task/features/posts/presentation/bloc/post_details_bloc.dart';
import 'package:buncode_task/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buncode_task/features/posts/domain/usecases/get_post_details_usecase.dart';
import 'package:buncode_task/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:buncode_task/features/posts/data/repositories/post_repository_impl.dart';

void main() {
  final postRepository = PostRepositoryImpl();

  runApp(Test2TestApp(postRepository: postRepository));
}

class Test2TestApp extends StatelessWidget {
  final PostRepository postRepository;
  const Test2TestApp({super.key, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostsBloc(GetPostsUseCase(postRepository))..add(FetchPostsEvent()),
        ),
        BlocProvider(
          create: (context) => PostDetailsBloc(GetPostDetailsUseCase(postRepository)),
        ),
      ],
      child: const MaterialApp(
        title: 'Test2Test',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
