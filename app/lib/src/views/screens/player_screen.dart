import 'package:app/src/config/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/modules/episode/bloc/episode_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlayerScreen extends StatefulWidget {
  final String episodeId;

  PlayerScreen({@required this.episodeId});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void dispose() {
    // controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EpisodeBloc>(context)
        .add(EpisodeRequested(episodeId: widget.episodeId));
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        if (state is EpisodeLoading) {
          return Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is EpisodeLoadSuccess) {
          return _animePlayer(context, state);
        }
        if (state is EpisodeLoadFailure) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else {
          return Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    ));
  }

  Widget _animePlayer(BuildContext context, EpisodeLoadSuccess state) {
    // ignore: close_sinks
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: state.episode.videoId,
      params: YoutubePlayerParams(
        playlist: [state.episode.videoId], // Defining custom playlist
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              YoutubePlayerIFrame(
                controller: controller,
                aspectRatio: 16 / 9,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.episode.title,
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      CustomMethods.getDesc(state.episode.description),
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
