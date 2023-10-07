class CommentModel {
  final String id;
  String text;
  final DateTime createdAt;
  final String postId;
  final String username;
  final String profilePic;
  int upvotesCount;
  int downVotesCount;
  bool upvoteIconPressed;
  bool downVoteIconPressed;
  CommentModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.postId,
    required this.username,
    required this.profilePic,
    required this.upvotesCount,
    required this.downVotesCount,
    this.upvoteIconPressed = false,
    this.downVoteIconPressed = false,
  });

  CommentModel copyWith({
    String? id,
    String? text,
    DateTime? createdAt,
    String? postId,
    String? username,
    String? profilePic,
    int? upvotesCount,
    int? downVotesCount,
    bool? upvoteIconPressed,
    bool? downVoteIconPressed,
  }) {
    return CommentModel(
      id: id ?? this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      postId: postId ?? this.postId,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      upvotesCount: upvotesCount ?? this.upvotesCount,
      downVotesCount: upvotesCount ?? this.upvotesCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'postId': postId,
      'username': username,
      'profilePic': profilePic,
      'upvotes': upvotesCount,
      'downvotes': downVotesCount,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      postId: map['postId'] ?? '',
      username: map['username'] ?? '',
      profilePic: map['profilePic'] ?? '',
      upvotesCount: map['upvotesCount'] as int,
      downVotesCount: map['downVotesCount'] as int,
    );
  }
}
