import 'package:app/src/views/screens/anime_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';
import 'package:shared/modules/anime_home/models/all_anime.dart';
import 'package:app/src/config/color_constants.dart';

class AnimeWidget extends StatelessWidget {
  final AnimeShort anime;

  AnimeWidget(this.anime);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          // context.vRouter.push('/anime/${anime.id}');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => AnimeScreen(
                        animeId: anime.id,
                      )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                anime.imageUrl,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 4, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RatingBarIndicator(
                    rating: (anime.rating) / 2,
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
