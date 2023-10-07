import 'package:flutter/material.dart';
import 'package:reddit/data/models/comment_model.dart';
import 'package:reddit/logic/provider/comment_provider.dart';
import 'package:reddit/views/reddit_video_page/widgets/comment_card.dart';

TextEditingController _controller = TextEditingController();
Stack commentWidget(
    BuildContext context, int listSize, CommentProvider commentProvider) {
  return Stack(
    children: [
      Container(
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
              ListView.separated(
                  itemCount: listSize,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      // add padding olny to the last item and the first item
                      padding: EdgeInsets.only(
                          bottom: index == listSize - 1 ? 60 : 0,
                          top: index == 0 ? 10 : 0),
                      child: InkWell(
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Wrap(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.share),
                                      title: const Text('Share'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading:
                                          const Icon(Icons.save_alt_outlined),
                                      title: const Text('Save'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.copy),
                                      title: const Text('Copy'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading:
                                          const Icon(Icons.mode_edit_outlined),
                                      title: const Text('Edit'),
                                      onTap: () {
                                        //  commentProvider.editComment(text: _controller.text , index: index );
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                          Icons.delete_outline_sharp),
                                      title: const Text('Delete'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Are you sure?'),
                                              content: const Text(
                                                'You cannot restore comments that have been deleted',
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Close the dialog
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    commentProvider.deleteComment(
                                                        id: commentProvider
                                                            .getCommentModelList![
                                                                index]
                                                            .id);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.close),
                                      title: const Text('Close'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 115,
                          color: Colors.black54,
                          width: double.infinity,
                          child: CommentCard(
                            commentIndex: index,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 340),
        child: Container(
          height: 50,
          color: Colors.grey.shade900,
          child: Column(children: [
            const SizedBox(height: 2),
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                commentProvider.addComment(
                    commentModel: CommentModel(
                        id: '${DateTime.now()}',
                        text: value,
                        createdAt: DateTime(2023),
                        postId: '${DateTime.now()}',
                        username: 'amr',
                        profilePic:
                            'https://avatars.githubusercontent.com/u/60432384?s=400&u=1e2df219b67ba242c95fe66fd3380090d88016d4&v=4',
                        upvotesCount: 0,
                        downVotesCount: 0));
                _controller.text = '';
              },
              decoration: InputDecoration(
                hintText: 'Add a comment',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade700, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade700, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ]),
        ),
      ),
    ],
  );
}
