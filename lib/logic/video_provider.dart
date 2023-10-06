import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/data/models/post.model.dart';

final videoProvider =
    ChangeNotifierProvider<VideoProvider>((ref) => VideoProvider());

class VideoProvider extends ChangeNotifier {
  PostModel? _postModel;
  PostModel? get getPostModel => _postModel;

  createPostModel() {
    _postModel = PostModel(
      userName: 'AmrMahmoud',
      title: 'beeVideo',
      videoLink:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      description:
          'Random text Random text Random text Random text Random text Random text Random text ',
      upvotesCount: 240,
      downVotesCount: 20,
      commentCount: 165,
    );
  }
}
