import 'package:audio_learn/components/CustomHeader.dart';
import 'package:audio_learn/components/PlaylistItem.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({required this.chapterId});
  final int chapterId;
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
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

var selectedIndex = null;

class _PlaylistScreenState extends State<PlaylistScreen> {
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
          category: "H1",
          type: "Playlist"),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: width,
        height: height,
        color: Colors.white,
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: PlayListItem(
                    name: playlist[index]['name'].toString(),
                    context: context,
                    playing: index == selectedIndex ? true : false),
              );
            },
            itemCount: playlist.length,
          ),
        ),
      ),
    );
  }
}
