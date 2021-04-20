import 'package:app/src/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/modules/anime_home/models/all_anime.dart';

class AnimeWidget extends StatelessWidget {
  final AnimeShort anime;

  AnimeWidget(this.anime);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            anime.imageUrl,
            height: size.height * 0.3,
            fit: BoxFit.cover,
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
                      fontSize: 14, color: ColorConstants.primaryTextColor),
                ),
                RatingBarIndicator(
                  rating: anime.rating,
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
    );
  }
}
