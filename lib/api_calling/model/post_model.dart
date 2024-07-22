class PostModel {
  List<Post>? posts;
  int? total, skip, limit;
  static PostModel postModel = PostModel.temp();

  PostModel.temp();

  PostModel(
      {required this.posts,
      required this.total,
      required this.skip,
      required this.limit});

  factory PostModel.fromJson(Map json) {
    return PostModel(
        posts: ((json['posts'] as List).map((e) => Post.fromJson(e))).toList(),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}

class Post {
  String title, body;
  int views, userId;
  List tags;
  Reactions reaction;

  Post(
      {required this.title,
      required this.body,
      required this.views,
      required this.tags,
      required this.reaction,
      required this.userId});

  factory Post.fromJson(Map json) {
    return Post(
        title: json['title'],
        body: json['body'],
        views: json['views'],
        tags: json['tags'] as List,
        userId: json['userId'],
        reaction: Reactions.fromJson(json['reactions']));
  }
}

class Reactions {
  int likes, dislikes;

  Reactions({required this.likes, required this.dislikes});

  factory Reactions.fromJson(Map json) {
    return Reactions(likes: json['likes'], dislikes: json['dislikes']);
  }
}
