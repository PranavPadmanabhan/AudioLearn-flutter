import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget CustomAppBar({required username, required url}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    shadowColor: Colors.white,
    toolbarHeight: 70,
    leadingWidth: 80,
    leading: Container(
      margin: EdgeInsets.all(5),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(url),
      ),
    ),
    titleSpacing: -5,
    bottomOpacity: 0,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Text(
              "AUDIO",
              style: TextStyle(
                  color: Color.fromRGBO(1, 138, 22, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "LEARN",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    ],
    title: Text(
      username,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
