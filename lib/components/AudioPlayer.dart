import 'package:audio_learn/components/CustomHeader.dart';
import 'package:flutter/material.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key}) : super(key: key);

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

var url =
    "https://static.theceomagazine.net/wp-content/uploads/2018/10/15093202/elon-musk.jpg";

List playlist = [
  {"name": "sub1", "id": "1"},
  {"name": "sub2", "id": "2"},
  {"name": "sub3", "id": "3"},
  {"name": "sub4", "id": "4"},
  {"name": "sub5", "id": "5"},
  {"name": "sub6", "id": "6"},
];

class _AudioPlayerState extends State<AudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            username: "MUSK", url: url, appName: false, category: "SUB1"),
        body: Column());
  }
}
