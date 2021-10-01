import 'dart:convert';

import 'package:audio_learn/components/ChapterListItem.dart';
import 'package:audio_learn/components/CustomHeader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({required this.subjectId});
  final int subjectId;
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

var url =
    "https://static.theceomagazine.net/wp-content/uploads/2018/10/15093202/elon-musk.jpg";

List Chapters = [
  // {"name": "sub1", "id": "1"},
  // {"name": "sub2", "id": "2"},
  // {"name": "sub3", "id": "3"},
  // {"name": "sub4", "id": "4"},
  // {"name": "sub5", "id": "5"},
  // {"name": "sub6", "id": "6"},
];

class _ChapterScreenState extends State<ChapterScreen> {
  fetchChapters() async {
    var url = Uri.parse(
        "http://192.168.113.72:8000/contentmanagement/api/chapter?sub_id=${widget.subjectId}");
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data);
    setState(() {
      Chapters = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchChapters();
  }

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
      body: Container(
        padding: EdgeInsets.only(top: 50),
        height: height,
        width: width,
        color: Colors.white70,
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: ChapterListItem(
                      context: context,
                      name: Chapters[index]["name"].toString()));
            },
            itemCount: Chapters.length,
          ),
        ),
      ),
    );
  }
}
