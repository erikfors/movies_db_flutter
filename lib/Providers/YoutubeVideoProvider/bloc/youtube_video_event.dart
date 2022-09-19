part of 'youtube_video_bloc.dart';

abstract class YoutubeVideoEvent extends Equatable {
  const YoutubeVideoEvent();

  @override
  List<Object> get props => [];
}

class YoutubeVideoKeyFetched extends YoutubeVideoEvent{}
