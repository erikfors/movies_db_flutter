import 'package:equatable/equatable.dart';

class Author extends Equatable{
  late String username;
  late String avatarPath;

  Author({required this.username,required this.avatarPath,});

  Author.fromMap(Map<String, dynamic> map,){
     map.forEach((key, value){
      switch(key){
        case "username":
          username = value;
          break;
        case "avatar_path":
          avatarPath = value ?? "";
          break;
          default:
      }
     });
  }
  
  @override
  List<Object?> get props => [username,avatarPath];

}