import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String episodeId;

  PlayerScreen({@required this.episodeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$episodeId'),
      ),
    );
  }
}
