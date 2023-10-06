import 'package:flutter/material.dart';
import 'package:reddit/data/models/post.model.dart';
import 'package:reddit/logic/video_provider.dart';
import 'package:reddit/views/reddit_video_page/widgets/custom_app_bar_.dart';
import 'package:reddit/views/reddit_video_page/widgets/video_options_widget.dart';
import 'package:reddit/views/reddit_video_page/widgets/video_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RedditVideoScreen extends ConsumerStatefulWidget {
  const RedditVideoScreen({Key? key}) : super(key: key);

  @override
  _RedditVideoScreenState createState() => _RedditVideoScreenState();
}

class _RedditVideoScreenState extends ConsumerState<RedditVideoScreen> {
  late PostModel postModel;
  getPostData() {
    ref.read(videoProvider).createPostModel();
    postModel = ref.read(videoProvider).getPostModel!;
  }

  @override
  void initState() {
    getPostData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              VideoWidget(
                videoUrl: postModel.videoLink,
              ),
              Positioned(
                top: 42,
                left: 10,
                child: CustomAppBar(
                  title: postModel.title,
                ),
              ),
              Positioned(
                  top: 480,
                  right: 5,
                  child: VideoOptionsWidget(
                    postModel: postModel,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
