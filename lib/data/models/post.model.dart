class PostModel {
  final String title;
  final String userName;
  final String videoLink;
  final String description;
  int upvotesCount;
  final int downVotesCount;
  final int commentCount;

  PostModel({
    required this.userName,
    required this.title,
    required this.videoLink,
    required this.description,
    required this.upvotesCount,
    required this.downVotesCount,
    required this.commentCount,
  });

  PostModel copyWith({
    String? userName,
    String? title,
    String? videoLink,
    String? description,
    int? upvotesCount,
    int? downVotesCount,
    int? commentCount,
  }) {
    return PostModel(
      userName: userName ?? this.userName,
      title: title ?? this.title,
      videoLink: videoLink ?? this.videoLink,
      description: description ?? this.description,
      upvotesCount: upvotesCount ?? this.upvotesCount,
      downVotesCount: upvotesCount ?? this.upvotesCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'title': title,
      'videoLink': videoLink,
      'description': description,
      'upvotes': upvotesCount,
      'downvotes': downVotesCount,
      'commentCount': commentCount,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'] as String,
      title: map['title'] as String,
      videoLink: map['videoLink'],
      description: map['description'],
      upvotesCount: map['upvotesCount'] as int,
      downVotesCount: map['downVotesCount'] as int,
      commentCount: map['commentCount'] as int,
    );
  }
}
