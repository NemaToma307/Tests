

class Model {

  var id ;
  var userId;
  String? title2;
  String? body2;

  Model({
    required this.id,
    required this.userId,
    required this.title2,
    required this.body2
});

  Model.fromMap(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    title2 = json['title'].toString();
    body2 = json['body'];
  }



}