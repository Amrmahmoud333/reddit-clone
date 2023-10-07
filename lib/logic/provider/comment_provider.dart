import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/data/models/comment_model.dart';

final commentProvider =
    ChangeNotifierProvider<CommentProvider>((ref) => CommentProvider());

class CommentProvider extends ChangeNotifier {
  List<CommentModel>? _commentModelList;
  List<CommentModel>? get getCommentModelList => _commentModelList;

  createPostModel() {
    List<CommentModel> _commentModelCopy = [];
    for (int i = 0; i < 3; i++) {
      _commentModelCopy.insert(
        0,
        CommentModel(
            id: '$i',
            text: '${i * 250000} test',
            createdAt: DateTime(2023),
            postId: '11',
            username: 'amr',
            profilePic:
                'https://avatars.githubusercontent.com/u/60432384?s=400&u=1e2df219b67ba242c95fe66fd3380090d88016d4&v=4',
            downVotesCount: 2,
            upvotesCount: 12),
      );
    }
    _commentModelList = _commentModelCopy;
  }

  addComment({required CommentModel commentModel}) {
    _commentModelList!.add(commentModel);
    notifyListeners();
  }

  deleteComment({required String id}) {
    _commentModelList!.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editComment({required String text, required int index}) {
    // send a netwrok request to edit it before edit the list
    _commentModelList![index].text = text;
  }

  upVote({required int commentIndex}) {
    // click on up vote for the second time
    if (_commentModelList![commentIndex].upvoteIconPressed) {
      _commentModelList![commentIndex].upvotesCount--;
      _commentModelList![commentIndex].upvoteIconPressed = false;
    } else {
      _commentModelList![commentIndex].upvotesCount++;
      _commentModelList![commentIndex].upvoteIconPressed = true;
      _commentModelList![commentIndex].downVoteIconPressed = false;
    }

    notifyListeners();
  }

  downVote({required int commentIndex}) {
    if (_commentModelList![commentIndex].downVoteIconPressed) {
      _commentModelList![commentIndex].downVotesCount--;
      _commentModelList![commentIndex].downVoteIconPressed = false;
    } else {
      _commentModelList![commentIndex].downVotesCount++;
      _commentModelList![commentIndex].downVoteIconPressed = true;
      _commentModelList![commentIndex].upvoteIconPressed = false;
    }

    notifyListeners();
  }

  int getTotalNumberOfVotes({required int commentIndex}) {
    return _commentModelList![commentIndex].upvotesCount -
        _commentModelList![commentIndex].downVotesCount;
  }
}
