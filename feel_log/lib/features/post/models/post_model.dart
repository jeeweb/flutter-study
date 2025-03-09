class PostModel {
  final int postId;
  final double moodTheme;
  final String postTitle;
  final String postContent;
  final DateTime createdAt;
  final String userId;

  PostModel({
    required this.postId,
    required this.moodTheme,
    required this.postTitle,
    required this.postContent,
    required this.createdAt,
    required this.userId,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : postId = json["postId"],
        moodTheme = json["moodTheme"],
        postTitle = json["postTitle"],
        postContent = json["postContent"],
        createdAt = json["createdAt"],
        userId = json["userId"];

  Map<String, dynamic> toJson() {
    return {
      "postId": postId,
      "moodTheme": moodTheme,
      "postTitle": postTitle,
      "postContent": postContent,
      "createdAt": createdAt,
      "userId": userId,
    };
  }
}
