class PostModel {
  final String postId;
  final double moodTheme;
  final String postTitle;
  final String postContent;
  final DateTime logDate;
  final DateTime createdAt;
  final String userId;

  PostModel({
    required this.postId,
    required this.moodTheme,
    required this.postTitle,
    required this.postContent,
    required this.logDate,
    required this.createdAt,
    required this.userId,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : postId = json["postId"].toString(),
        moodTheme = json["moodTheme"],
        postTitle = json["postTitle"],
        postContent = json["postContent"],
        logDate = (json['createdAt']).toDate(),
        createdAt = (json['createdAt']).toDate(),
        userId = json["userId"];

  Map<String, dynamic> toJson() {
    return {
      "postId": postId,
      "moodTheme": moodTheme,
      "postTitle": postTitle,
      "postContent": postContent,
      "logDate": logDate,
      "createdAt": createdAt,
      "userId": userId,
    };
  }
}
