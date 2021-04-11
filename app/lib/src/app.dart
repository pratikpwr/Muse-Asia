import 'package:flutter/material.dart';
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
    return VRouter(
        title: APP_NAME, debugShowCheckedModeBanner: false, routes: routes);
  }
}
