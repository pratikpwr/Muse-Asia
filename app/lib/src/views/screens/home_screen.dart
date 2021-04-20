import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/string_constants.dart';
import 'package:app/src/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/modules/anime/bloc/anime_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(GetAnimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            sectionHeadingText('Recent Releases'),
            Container(
                height: size.height * 0.4,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return EpisodeWidget();
                  },
                )),

            sectionHeadingText('All Anime'),
            BlocBuilder<AnimeBloc, AnimeState>(
              builder: (context, state) {
                if (state is AnimeLoadingState) {
                  return Container(
                    height: size.height,
                    width: size.width,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is AnimeSuccessState) {
                  return _buildAnimeGrid(state);
                }
                if (state is AnimeFailureState) {
                  return Center(
                    child: Text(state.message.toString()),
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

  Widget _buildAnimeGrid(AnimeSuccessState state) {
    return Container(
      margin: EdgeInsets.all(6),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 9 / 16),
          itemCount: state.anime.items.length,
          itemBuilder: (context, index) {
            return AnimeWidget(
              title: state.anime.items[index].snippet.title,
              rating: 3.5,
              imageUrl: state.anime.items[index].snippet.thumbnails.high.url,
            );
          }),
    );
  }

  Widget searchAnimeTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorConstants.primaryTextColor),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstants.primaryTextColor,
            ),
            hintText: 'Search Anime',
            hintStyle: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstants.primaryTextColor),
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
        style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorConstants.primaryTextColor),
      ),
    );
  }
}
