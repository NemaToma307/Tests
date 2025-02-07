

class ModelComments{


  var commentId;
  String? body;
  var postId;
  var likes;

  UsersModel? user;

  ModelComments({
    required this.commentId,
    required this.body,
    required this.postId,
    required this.likes,
    required this.user,
});


  // ModelComments.fromMap(dynamic json) {
  //   id = json['id'];
  //   body = json['body'];
  //   likes = json['likes'];
  //   user = (json['user']).map((data) => UsersModel(  id: data['id'], userName: data['username'], fullName: data['fullName']) , ).toList();
  // }

  factory ModelComments.fromJson(Map<String, dynamic> json) {
    return ModelComments(
      commentId: json['id'],
      body: json['body'],
      postId: json['postId'],
      likes: json['likes'],
      user: UsersModel.fromJson(json['user']),
    );
  }


}

class UsersModel {

  var id;
  String? userName;
  String? fullName;

  UsersModel({
    required this.id,
    required this.userName,
    required this.fullName
});


  //
  // UsersModel.fromMap(dynamic json) {
  //   id = json['id'];
  //   userName = json['username'];
  //   fullName = json['fullName'];
  // }
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      userName: json['username'],
      fullName: json['fullName'],
    );
  }


}

class CommentResponse {
  final List<ModelComments> comments;
  final int total;
   var dd;

  CommentResponse({required this.comments, required this.total, required this.dd});

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    var commentList = (json['comments'] as List)
        .map((comment) => ModelComments.fromJson(comment))
        .toList();

    return CommentResponse(
      comments: commentList,
      total: json['total'],
      dd: json['limit'],
    );
  }
}