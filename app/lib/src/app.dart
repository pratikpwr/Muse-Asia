import 'package:app/src/config/theme_data.dart';
import 'package:app/src/views/screens/auth_screen.dart';
import 'package:app/src/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/modules/anime_details/bloc/anime_details_bloc.dart';
import 'package:shared/modules/anime_home/bloc/anime_home_bloc.dart';
import 'package:shared/modules/auth/bloc/auth_bloc.dart';
import 'package:shared/modules/episode/bloc/episode_bloc.dart';
import 'package:vrouter/vrouter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// Vrouter
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => AnimeHomeBloc()),
//         BlocProvider(create: (context) => AnimeDetailsBloc())
//       ],
//       child: VRouter(
//           title: APP_NAME,
//           theme: ThemeConfig.lightTheme,
//           debugShowCheckedModeBanner: false,
//           routes: routes),
//     );
//   }
// }

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var isLoggedIn = false;

  @override
  void initState() {
    getStatus();
    super.initState();
  }

  Future<void> getStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    isLoggedIn = _prefs.getBool('LoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => AnimeHomeBloc()),
        BlocProvider(create: (context) => AnimeDetailsBloc()),
        BlocProvider(create: (context) => EpisodeBloc())
      ],
      child: MaterialApp(
        title: APP_NAME,
        theme: ThemeConfig.lightTheme,
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
        // home: isLoggedIn ? HomeScreen() : AuthScreen(),
      ),
    );
  }
}

