import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'youtube_video_event.dart';
part 'youtube_video_state.dart';

class YoutubeVideoBloc extends Bloc<YoutubeVideoEvent, YoutubeVideoState> {
  YoutubeVideoBloc() : super(YoutubeVideoInitial()) {
    on<YoutubeVideoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
