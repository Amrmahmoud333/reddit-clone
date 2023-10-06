import 'package:flutter/material.dart';
import 'package:reddit/views/reddit_video_page/widgets/video_widget.dart';

class RedditVideoScreen extends StatelessWidget {
  const RedditVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              VideoWidget(
                videoUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              ),
            ],
          )
        ],
      ),
    );
  }
}
