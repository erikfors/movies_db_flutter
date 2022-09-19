import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Logic/Requests/youtube_key_request.dart';

part 'youtube_video_event.dart';
part 'youtube_video_state.dart';

class YoutubeVideoBloc extends Bloc<YoutubeVideoEvent, YoutubeVideoState> {
  final int movieID;

  YoutubeVideoBloc(this.movieID) : super(const YoutubeVideoState()) {
    on<YoutubeVideoKeyFetched>(_onYoutubeKeyFetch);
  }

  Future<void> _onYoutubeKeyFetch(
      YoutubeVideoKeyFetched event, Emitter<YoutubeVideoState> emit) async {
    try {
      if (state.status == YoutubeKeyStatus.initial) {
        final key = await YoutubeKeyRequest.getMovieTrailerKey(movieID);

        return emit(
            state.copyWith(youtubeKey: key, status: YoutubeKeyStatus.success));
      }
    } catch (_) {
      emit(state.copyWith(status: YoutubeKeyStatus.failure));
    }
  }
}
