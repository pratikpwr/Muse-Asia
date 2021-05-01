import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/string_constants.dart';
import 'package:app/src/views/views.dart';
import 'package:shared/modules/anime_home/bloc/anime_home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AnimeHomeBloc>(context).add(AnimeRequested());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  APP_NAME,
                  style: GoogleFonts.balooThambi(
                      fontSize: 26, color: ColorConstants.accentColor),
                )),
            searchAnimeTextField(),
            SizedBox(
              height: 8,
            ),
            // sectionHeadingText('Recent Releases'),
            // Container(
            //     height: size.height * 0.4,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: BouncingScrollPhysics(),
            //       itemCount: 8,
            //       itemBuilder: (context, index) {
            //         return EpisodeWidget();
            //       },
            //     )),

            BlocBuilder<AnimeHomeBloc, AnimeHomeState>(
              builder: (context, state) {
                if (state is AnimeLoading) {
                  return Container(
                    height: size.height * 0.8,
                    width: size.width,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is AnimeLoadSuccess) {
                  return Column(
                    children: [
                      sectionHeadingText('Recent Releases'),
                      Container(
                          height: size.height * 0.37,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return EpisodeWidget(
                                episode: state.recentEpisodes[index],
                                animeImageUrl:
                                    state.recentEpisodes[index].imageUrl,
                              );
                            },
                          )),
                      sectionHeadingText('All Anime'),
                      _buildAnimeGrid(size, state),
                    ],
                  );
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
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildAnimeGrid(Size size, AnimeLoadSuccess state) {
    return Container(
      margin: EdgeInsets.all(6),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width > 1100 ? 6 : 2,
              childAspectRatio: 9 / 15.7),
          itemCount: state.listOfAnime.length,
          itemBuilder: (context, index) {
            return AnimeWidget(state.listOfAnime[index]);
          }),
    );
  }

  Widget searchAnimeTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        style: GoogleFonts.montserrat(fontSize: 14),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: 'Search Anime',
            hintStyle: GoogleFonts.montserrat(fontSize: 14),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        autofocus: false,
        cursorColor: ColorConstants.accentColor,
      ),
    );
  }

  Widget sectionHeadingText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style:
            GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
