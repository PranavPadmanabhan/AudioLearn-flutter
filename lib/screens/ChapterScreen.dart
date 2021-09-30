import 'package:audio_learn/components/CustomHeader.dart';
import 'package:flutter/material.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({required this.subjectId});
  final int subjectId;
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

var url =
    "https://static.theceomagazine.net/wp-content/uploads/2018/10/15093202/elon-musk.jpg";

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          username: "MUSK",
          url: url,
          appName: false,
          category: "Kerala Cultural Heritage"),
    );
  }
}
