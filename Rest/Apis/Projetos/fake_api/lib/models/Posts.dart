class Posts {

  String title;
  String body;
  int userId;

  Posts({this.title, this.body, this.userId});

  Posts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId
    };
  }

}