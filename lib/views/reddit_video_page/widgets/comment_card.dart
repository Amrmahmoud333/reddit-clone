import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/data/models/comment_model.dart';
import 'package:reddit/logic/provider/comment_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentCard extends ConsumerWidget {
  final CommentModel comment;
  final int commentIndex;
  const CommentCard({
    super.key,
    required this.comment,
    required this.commentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CommentProvider commentProv = ref.watch(commentProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    comment.profilePic,
                  ),
                  radius: 13,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'u/${comment.username}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${comment.createdAt.year}',
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Text(comment.text),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  commentProv.upVote(commentIndex: commentIndex);
                },
                child: TweenAnimationBuilder(
                  tween: ColorTween(
                    begin: commentProv.upvoteIconPressed
                        ? Colors.redAccent
                        : Colors.transparent,
                    end: commentProv.upvoteIconPressed
                        ? Colors.redAccent
                        : Colors.white,
                  ),
                  duration: const Duration(milliseconds: 250),
                  builder: (context, color, child) {
                    return SvgPicture.asset(
                      commentProv.upvoteIconPressed
                          ? 'assets/icons/upvote_icon_full.svg'
                          : 'assets/icons/upvote_icon.svg',
                      color: color,
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              // Text(
              //   '${(commentProv.getTotalNumberOfVotes(commentIndex: commentIndex))}',
              //   style: const TextStyle(color: Colors.white),
              // ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  commentProv.downVote(commentIndex: commentIndex);
                },
                child: TweenAnimationBuilder(
                  tween: ColorTween(
                    begin: commentProv.downVoteIconPressed
                        ? Colors.blueAccent
                        : Colors.transparent,
                    end: commentProv.downVoteIconPressed
                        ? Colors.blueAccent
                        : Colors.white,
                  ),
                  duration: const Duration(milliseconds: 250),
                  builder: (context, color, child) {
                    return SvgPicture.asset(
                      commentProv.downVoteIconPressed
                          ? 'assets/icons/downvote_icon_full.svg'
                          : 'assets/icons/downvote_icon.svg',
                      color: color,
                    );
                  },
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.reply),
              ),
              const Text('Reply'),
            ],
          ),
        ],
      ),
    );
  }
}
