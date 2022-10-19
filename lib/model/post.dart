class Post {
  final int userid;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userid,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromMap({required Map<String, dynamic> data}) {
    return Post(
        userid: data['userId'],
        id: data['id'],
        title: data['title'],
        body: data['body'],);
  }
}
