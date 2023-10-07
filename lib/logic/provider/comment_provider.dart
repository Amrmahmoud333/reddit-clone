import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/data/models/comment_model.dart';

final commentProvider =
    ChangeNotifierProvider<CommentProvider>((ref) => CommentProvider());

class CommentProvider extends ChangeNotifier {
  List<CommentModel>? _commentModel;
  List<CommentModel>? get getCommentModel => _commentModel;

  createPostModel() {
    List<CommentModel> _commentModelCopy = [];
    for (int i = 0; i < 8; i++) {
      _commentModelCopy.add(
        CommentModel(
            id: 'id',
            text: 'aaaaaaaa',
            createdAt: DateTime(2023),
            postId: '11',
            username: 'amr',
            profilePic:
                'https://avatars.githubusercontent.com/u/60432384?s=400&u=1e2df219b67ba242c95fe66fd3380090d88016d4&v=4',
            downVotesCount: 2,
            upvotesCount: 12),
      );
    }
    _commentModel = _commentModelCopy;
  }

  upVote({required int commentIndex}) {
    // click on up vote for the second time
    if (_commentModel![commentIndex].upvoteIconPressed) {
      _commentModel![commentIndex].upvotesCount--;
      _commentModel![commentIndex].upvoteIconPressed = false;
    } else {
      _commentModel![commentIndex].upvotesCount++;
      _commentModel![commentIndex].upvoteIconPressed = true;
      _commentModel![commentIndex].downVoteIconPressed = false;
    }

    notifyListeners();
  }

  downVote({required int commentIndex}) {
    if (_commentModel![commentIndex].downVoteIconPressed) {
      _commentModel![commentIndex].downVotesCount--;
      _commentModel![commentIndex].downVoteIconPressed = false;
    } else {
      _commentModel![commentIndex].downVotesCount++;
      _commentModel![commentIndex].downVoteIconPressed = true;
      _commentModel![commentIndex].upvoteIconPressed = false;
    }

    notifyListeners();
  }

  int getTotalNumberOfVotes({required int commentIndex}) {
    return _commentModel![commentIndex].upvotesCount -
        _commentModel![commentIndex].downVotesCount;
  }
}
