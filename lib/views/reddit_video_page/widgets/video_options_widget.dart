import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reddit/data/models/post.model.dart';

class VideoOptionsWidget extends StatelessWidget {
  const VideoOptionsWidget({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            postModel.upvotesCount++;
          },
          child: SvgPicture.asset(
            'assets/icons/upvote_icon.svg',
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${(postModel.upvotesCount - postModel.downVotesCount)}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/downvote_icon.svg',
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
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
        const SizedBox(height: 20),
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
