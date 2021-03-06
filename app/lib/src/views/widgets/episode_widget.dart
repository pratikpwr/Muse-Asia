import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/views/screens/player_screen.dart';
import 'package:app/src/views/screens/youtube_screen.dart';
import 'package:flutter/foundation.dart';
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
          if (kIsWeb) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => PlayerScreen(episodeId: episode.id)));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => YoutubeScreen(episodeId: episode.id)));
          }
        },
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      animeImageUrl,
                      height: size.height * 0.3,
                    )),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 36,
                      width: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AllImages().orangeShape),
                              fit: BoxFit.cover)),
                      child: Text(
                        '${episode.episodeNo}',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, color: Colors.white),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Episode No. ${episode.episodeNo}',
              style: GoogleFonts.montserrat(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
