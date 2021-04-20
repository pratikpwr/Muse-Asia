import 'dart:ui';

import 'package:app/src/config/color_constants.dart';
import 'package:app/src/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/modules/anime_details/bloc/anime_details_bloc.dart';

class AnimeScreen extends StatelessWidget {
  final String animeId;

  AnimeScreen({@required this.animeId});

  @override
  Widget build(BuildContext context) {
    // final id = context.vRouter.pathParameters['id'];
    BlocProvider.of<AnimeDetailsBloc>(context)
        .add(AnimeRequested(animeId: animeId));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AnimeDetailsBloc, AnimeDetailsState>(
        // bloc: AnimeDetailsBloc(),
        builder: (context, state) {
          if (state is AnimeLoading) {
            return Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is AnimeLoadSuccess) {
            return _animeDetails(context, state);
          }
          if (state is AnimeLoadFailure) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      ),
    );
  }

  Widget _animeDetails(BuildContext context, AnimeLoadSuccess state) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                        height: size.height * 0.6,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    size.width * 1.2, size.height * 0.3)),
                            image: DecorationImage(
                              image: NetworkImage(state.anime.imageUrl),
                              fit: BoxFit.cover,
                            )),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.0)),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.08,
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        state.anime.imageUrl,
                        height: size.height * 0.45,
                      )),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                state.anime.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            RatingBarIndicator(
              rating: (state.anime.rating) / 2,
              itemBuilder: (context, index) => Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 26.0,
              direction: Axis.horizontal,
            ),
            _playButton(),
            _sectionHeadingText('About'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                state.anime.description,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                    fontSize: 16, color: ColorConstants.primaryTextColor),
              ),
            ),
            _sectionHeadingText('Episodes (English Sub)'),
            _episodeSubList(size, state),
            _sectionHeadingText('Episodes (Chinese Sub)'),
            _episodeList(size, state),
          ],
        ),
      ),
    );
  }

  Widget _playButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.accentColor),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow_rounded,
              size: 26,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Play',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionHeadingText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorConstants.primaryTextColor),
      ),
    );
  }

  Widget _episodeSubList(Size size, AnimeLoadSuccess state) {
    return Container(
      height: size.height * 0.47,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: state.episodes.length,
        itemBuilder: (context, index) {
          return Visibility(
            visible: state.episodes[index].subtitle,
            child: EpisodeWidget(
              episode: state.episodes[index],
              animeImageUrl: state.anime.imageUrl,
            ),
          );
        },
      ),
    );
  }

  Widget _episodeList(Size size, AnimeLoadSuccess state) {
    return Container(
      height: size.height * 0.47,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: state.episodes.length,
        itemBuilder: (context, index) {
          return Visibility(
            visible: !state.episodes[index].subtitle,
            child: EpisodeWidget(
              episode: state.episodes[index],
              animeImageUrl: state.anime.imageUrl,
            ),
          );
        },
      ),
    );
  }
}
