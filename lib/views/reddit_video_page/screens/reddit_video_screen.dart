import 'package:flutter/material.dart';
import 'package:reddit/data/models/post.model.dart';
import 'package:reddit/logic/provider/comment_provider.dart';
import 'package:reddit/logic/provider/video_provider.dart';
import 'package:reddit/views/reddit_video_page/widgets/comment_widget.dart';
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
  ScrollController _scrollController = ScrollController();
  getPostData() {
    ref.read(videoProvider).createPostModel();
    postModel = ref.read(videoProvider).getPostModel!;
  }

  getPostComments() {
    ref.read(commentProvider).createPostModel();
  }

  @override
  void initState() {
    getPostData();
    getPostComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 2,
            controller: _scrollController,
            itemBuilder: (context, index) {
              // if the user clicked on the comment icon open the comments section
              if (ref.watch(videoProvider).commentIsPressed) {
                _scrollController.jumpTo(400);
              }
              return index == 0
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 22,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          VideoWidget(
                            videoUrl: postModel.videoLink,
                          ),
                          Positioned(
                            top: 12,
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
                      ),
                    )
                  : commentWidget(
                      context,
                      ref.read(commentProvider).getCommentModelList!.length,
                      ref.watch(commentProvider));
            },
          ),
        ),
      ),
    );
  }
}
