import 'package:app/src/config/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/modules/anime/bloc/anime_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/src/routes/routes.dart';
import 'package:app/src/config/string_constants.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: APP_NAME,
//       home: HomeScreen(),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeBloc(),
      child: VRouter(
          title: APP_NAME,
          theme: ThemeConfig.lightTheme,
          debugShowCheckedModeBanner: false,
          routes: routes),
    );
  }
}
