import 'package:app/src/views/views.dart';
import 'package:vrouter/vrouter.dart';

List<VRouteElement> routes = [
  VWidget(path: '/', widget: HomeScreen()),
  VWidget(path: '/anime/:id', widget: AnimeScreen()),
  VWidget(path: '/player', widget: PlayerScreen()),
  VRouteRedirector(
    // This matches any path
    path: ':_(.+)',
    // We redirect to /login
    redirectTo: '/',
  )
];
