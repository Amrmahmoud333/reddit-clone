import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reddit/data/models/post.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/logic/provider/video_provider.dart';

class VideoOptionsWidget extends ConsumerWidget {
  const VideoOptionsWidget({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    VideoProvider videoProv = ref.watch(videoProvider);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            videoProv.upVote();
          },
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: videoProv.upvoteIconPressed
                  ? Colors.redAccent
                  : Colors.transparent,
              end:
                  videoProv.upvoteIconPressed ? Colors.redAccent : Colors.white,
            ),
            duration: const Duration(milliseconds: 250),
            builder: (context, color, child) {
              return SvgPicture.asset(
                videoProv.upvoteIconPressed
                    ? 'assets/icons/upvote_icon_full.svg'
                    : 'assets/icons/upvote_icon.svg',
                color: color,
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${(videoProv.getTotalNumberOfVotes())}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            videoProv.downVote();
          },
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: videoProv.downVoteIconPressed
                  ? Colors.blueAccent
                  : Colors.transparent,
              end: videoProv.downVoteIconPressed
                  ? Colors.blueAccent
                  : Colors.white,
            ),
            duration: const Duration(milliseconds: 250),
            builder: (context, color, child) {
              return SvgPicture.asset(
                videoProv.downVoteIconPressed
                    ? 'assets/icons/downvote_icon_full.svg'
                    : 'assets/icons/downvote_icon.svg',
                color: color,
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            videoProv.pressOnComment();
          },
          child: Column(
            children: [
              const Icon(
                Icons.mode_comment_outlined,
                color: Colors.white,
              ),
              const SizedBox(height: 3),
              Text(
                '${postModel.commentCount}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          child: const Icon(
            Icons.file_upload_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
