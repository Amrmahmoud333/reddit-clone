import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoOptionsWidget extends StatelessWidget {
  const VideoOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/upvote_icon.svg',
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          '1000',
          style: TextStyle(color: Colors.white),
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
          child: const Column(
            children: [
              Icon(
                Icons.mode_comment_outlined,
                color: Colors.white,
              ),
              SizedBox(height: 3),
              Text(
                '1000',
                style: TextStyle(color: Colors.white),
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
