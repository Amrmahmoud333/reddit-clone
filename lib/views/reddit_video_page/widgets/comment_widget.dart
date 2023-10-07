import 'package:flutter/material.dart';
import 'package:reddit/views/reddit_video_page/widgets/comment_card.dart';

Container commentWidget(BuildContext context, int listSize) {
  return Container(
    height: MediaQuery.of(context).size.height / 1.8,
    decoration: BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: listSize,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: CommentCard(
                    commentIndex: index,
                  ),
                );
              }),
        ],
      ),
    ),
  );
}
