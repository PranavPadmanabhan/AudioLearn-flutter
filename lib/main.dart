import 'package:audio_learn/components/AudioPlayer.dart';
import 'package:audio_learn/screens/AuthenticationScreen.dart';
import 'package:audio_learn/screens/ChapterScreen.dart';
import 'package:audio_learn/screens/HomeScreen.dart';
import 'package:audio_learn/screens/PlaylistScreen.dart';
import 'package:audio_learn/screens/SubjectScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MediaPlayer(),
    debugShowCheckedModeBanner: false,
  ));
}
