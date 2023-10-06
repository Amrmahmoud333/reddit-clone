import 'package:flutter/material.dart';
import 'package:reddit/views/reddit_video_page/widgets/custom_app_bar_.dart';
import 'package:reddit/views/reddit_video_page/widgets/video_options_widget.dart';
import 'package:reddit/views/reddit_video_page/widgets/video_widget.dart';

class RedditVideoScreen extends StatelessWidget {
  const RedditVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              VideoWidget(
                videoUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              ),
              Positioned(
                top: 42,
                left: 10,
                child: CustomAppBar(),
              ),
              Positioned(top: 480, right: 5, child: VideoOptionsWidget()),
            ],
          )
        ],
      ),
    );
  }
}
