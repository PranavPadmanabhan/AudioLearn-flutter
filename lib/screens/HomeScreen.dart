import 'dart:convert';

import 'package:audio_learn/components/CategoryListItem.dart';
import 'package:audio_learn/components/CustomHeader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var url =
    "https://static.theceomagazine.net/wp-content/uploads/2018/10/15093202/elon-musk.jpg";
List categories = [
  // {"name": "sub1", "id": "1"},
  // {"name": "sub2", "id": "2"},
  // {"name": "sub3", "id": "3"},
  // {"name": "sub4", "id": "4"},
  // {"name": "sub5", "id": "5"},
  // {"name": "sub6", "id": "6"},
];

var selectedIndex = null;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategory();
  }

  fetchCategory() async {
    var url = Uri.parse(
        "http://192.168.113.72:8000/contentmanagement/api/categories/");
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data);
    setState(() {
      categories = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(username: "MUSK", url: url, appName: true),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(top: 50),
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
                  },
                  child: CategoryListItem(
                      title: categories[index]['name'].toString(),
                      active: index == selectedIndex ? true : false),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ));
  }
}
