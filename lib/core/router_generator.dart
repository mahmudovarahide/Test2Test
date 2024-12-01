import 'package:buncode_task/features/posts/presentation/pages/post_details_page.dart';
import 'package:buncode_task/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const PostsPage());

      case '/postDetails':
        final postId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => PostDetailsPage(postId: postId),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
