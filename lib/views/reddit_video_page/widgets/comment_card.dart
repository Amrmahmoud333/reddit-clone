import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/logic/provider/comment_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentCard extends ConsumerWidget {
  final int commentIndex;
  const CommentCard({
    super.key,
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
                    commentProv.getCommentModelList![commentIndex].profilePic,
                  ),
                  radius: 13,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'u/${commentProv.getCommentModelList![commentIndex].username}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${commentProv.getCommentModelList![commentIndex].createdAt.year}',
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Text(commentProv.getCommentModelList![commentIndex].text),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.reply,
                  size: 19,
                ),
              ),
              const Text('Reply'),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: () {
                  commentProv.upVote(commentIndex: commentIndex);
                },
                child: TweenAnimationBuilder(
                  tween: ColorTween(
                    begin: commentProv.getCommentModelList![commentIndex]
                            .upvoteIconPressed
                        ? Colors.redAccent
                        : Colors.transparent,
                    end: commentProv.getCommentModelList![commentIndex]
                            .upvoteIconPressed
                        ? Colors.redAccent
                        : Colors.white,
                  ),
                  duration: const Duration(milliseconds: 250),
                  builder: (context, color, child) {
                    return SvgPicture.asset(
                      commentProv.getCommentModelList![commentIndex]
                              .upvoteIconPressed
                          ? 'assets/icons/upvote_icon_full.svg'
                          : 'assets/icons/upvote_icon.svg',
                      color: color,
                    );
                  },
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '${(commentProv.getTotalNumberOfVotes(commentIndex: commentIndex))}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  commentProv.downVote(commentIndex: commentIndex);
                },
                child: TweenAnimationBuilder(
                  tween: ColorTween(
                    begin: commentProv.getCommentModelList![commentIndex]
                            .downVoteIconPressed
                        ? Colors.blueAccent
                        : Colors.transparent,
                    end: commentProv.getCommentModelList![commentIndex]
                            .downVoteIconPressed
                        ? Colors.blueAccent
                        : Colors.white,
                  ),
                  duration: const Duration(milliseconds: 250),
                  builder: (context, color, child) {
                    return SvgPicture.asset(
                      commentProv.getCommentModelList![commentIndex]
                              .downVoteIconPressed
                          ? 'assets/icons/downvote_icon_full.svg'
                          : 'assets/icons/downvote_icon.svg',
                      color: color,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
