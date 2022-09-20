import 'package:equatable/equatable.dart';
import 'package:movie_app/Models/author.dart';

class Review extends Equatable {
  late Author author;
  late String content;
  late DateTime createdAt;

  Review(
      {required this.author, required this.content, required this.createdAt});

  Review.fromMap(
    Map<String, dynamic> map,
  ) {
    map.forEach((key, value) {
      switch (key) {
        case "author_details":
          author = Author.fromMap(value);
          break;
        case "content":
          content = value;
          break;
        case "created_at":
          createdAt = DateTime.parse(value);
          break;
        default:
      }
    });
  }

  @override
  String toString() {
    var text = "Review by ${author.username} date $createdAt is $content";
    return text;
  }

  @override
  List<Object?> get props => [author, content, createdAt];
}
