class UserModel {
  final String username;
  final String email;

  UserModel({
    required this.username,
    required this.email,
  });

  UserModel.empty()
      : username = "",
        email = "";

  UserModel.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        email = json["email"];

  Map<String, String> toJson() {
    return {
      "username": username,
      "email": email,
    };
  }
}
