import 'dart:convert';

import 'package:audio_learn/components/CategoryListItem.dart';
import 'package:audio_learn/components/CustomHeader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubjectScreen extends StatefulWidget {
  SubjectScreen({required this.categoryId, this.data});
  final int categoryId;
  var data;
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

var url =
    "https://static.theceomagazine.net/wp-content/uploads/2018/10/15093202/elon-musk.jpg";

List subjects = [];

class _SubjectScreenState extends State<SubjectScreen> {
  fetchSubjects() async {
    var url = Uri.parse(
        "http://192.168.113.72:8000/contentmanagement/api/subjects?cat_id=${widget.categoryId}");
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data);
    setState(() {
      subjects = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.categoryId);
    fetchSubjects();
  }

  var selectedIndex = null;

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
        category: "PSC",
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        height: height,
        width: width,
        color: Colors.transparent,
        child: Center(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  print(subjects[index]['name'].toString().length);
                },
                child: CategoryListItem(
                    title: subjects[index]['name'].toString(),
                    active: index == selectedIndex ? true : false),
              );
            },
            itemCount: subjects.length,
          ),
        ),
      ),
    );
  }
}
