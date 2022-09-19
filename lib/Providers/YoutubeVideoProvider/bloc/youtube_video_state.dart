part of 'youtube_video_bloc.dart';

enum YoutubeKeyStatus{initial, success, failure}

 class YoutubeVideoState extends Equatable {
  final YoutubeKeyStatus status;
  final String youtubeKey;

  const YoutubeVideoState({this.status = YoutubeKeyStatus.initial,this.youtubeKey = ""});

  YoutubeVideoState copyWith({YoutubeKeyStatus? status, String? youtubeKey}){
    return YoutubeVideoState(status: status ?? this.status, youtubeKey: youtubeKey ?? this.youtubeKey);
  }

  @override
  String toString() {
    return '''YoutubeKeyState { status: $status, key: $youtubeKey }''';
  }
  
  @override
  List<Object> get props => [status,youtubeKey];
}

