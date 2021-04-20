import 'package:app/src/config/color_constants.dart';
import 'package:app/src/views/screens/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/modules/anime_details/models/anime_episodes.dart';

class EpisodeWidget extends StatelessWidget {
  final EpisodeShort episode;
  final String animeImageUrl;

  EpisodeWidget({@required this.episode, this.animeImageUrl});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 0, 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => PlayerScreen(episodeId: episode.id)));
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  animeImageUrl,
                  height: size.height * 0.4,
                )),
            SizedBox(
              height: 6,
            ),
            Text(
              'Episode No. ${episode.episodeNo}',
              style: GoogleFonts.montserrat(
                  fontSize: 16, color: ColorConstants.primaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
