import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Providers/YoutubeVideoProvider/bloc/youtube_video_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final int movieID;
  const YoutubePlayerWidget(this.movieID, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => YoutubeVideoBloc(movieID)
        ..add(
          YoutubeVideoKeyFetched(),
        ),
      child: const VideoWidget(),
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  YoutubePlayerController _controller(String key) => YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YoutubeVideoBloc, YoutubeVideoState>(
      builder: (context, state) {
        switch (state.status) {
          case YoutubeKeyStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case YoutubeKeyStatus.success:
            return YoutubePlayer(
              controller: _controller(state.youtubeKey),
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(playedColor: Colors.red, backgroundColor: Colors.black12),
            );
          case YoutubeKeyStatus.failure:
            return const Center(child: Text('failed to fetch key'));
        }
      },
    );
  }
}
