import 'package:flutter/material.dart';

class EpisodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 10/14,
      child: Container(
        margin: const EdgeInsets.all(8),
        color: Colors.black38,
      ),
    );
  }
}
