import 'package:app/src/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;

  AnimeWidget({this.title, this.imageUrl, this.rating});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: size.height * 0.4,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(left: 4, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontSize: 14, color: ColorConstants.primaryTextColor),
                ),
                RatingBarIndicator(
                  rating: rating,
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
