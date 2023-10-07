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
      commentCount: 3,
    );
  }

  bool _upvoteIconPressed = false;
  bool get upvoteIconPressed => _upvoteIconPressed;
  bool _downVoteIconPressed = false;
  bool get downVoteIconPressed => _downVoteIconPressed;

  upVote() {
    // click on up vote for the second time
    if (_upvoteIconPressed) {
      _postModel!.upvotesCount--;
      _upvoteIconPressed = false;
    } else if (_downVoteIconPressed) {
      // If the downvote is pressed that means remove the downvote and create a upvote
      _postModel!.upvotesCount++;
      _postModel!.downVotesCount--;
      _upvoteIconPressed = true;
      _downVoteIconPressed = false;
    } else {
      _postModel!.upvotesCount++;
      _upvoteIconPressed = true;
      _downVoteIconPressed = false;
    }

    notifyListeners();
  }

  downVote() {
    if (_downVoteIconPressed) {
      _postModel!.downVotesCount--;
      _downVoteIconPressed = false;
    } else if (_upvoteIconPressed) {
      _postModel!.downVotesCount++;
      _postModel!.upvotesCount--;
      _downVoteIconPressed = true;
      _upvoteIconPressed = false;
    } else {
      _postModel!.downVotesCount++;
      _downVoteIconPressed = true;
      _upvoteIconPressed = false;
    }

    notifyListeners();
  }

  int getTotalNumberOfVotes() {
    return _postModel!.upvotesCount - _postModel!.downVotesCount;
  }

  bool _commentIsPressed = false;
  bool get commentIsPressed => _commentIsPressed;

  pressOnComment() {
    _commentIsPressed = true;

    notifyListeners();
  }
}
