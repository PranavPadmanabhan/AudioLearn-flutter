import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget CustomAppBar({
  required username,
  required url,
  required bool appName,
  String? category,
  type,
}) {
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
        margin: EdgeInsets.only(
            right: (type != null || category!.length > 8) ? 15 : 25),
        child: Row(
            children: appbarWidgets(
          appName,
          category,
          type,
        )),
      )
    ],
    title: Text(
      username,
      style: TextStyle(
          color: Colors.black,
          fontSize: (category!.length > 8 || username.length > 10) ? 17 : 19),
    ),
  );
}

List<Widget> appbarWidgets(appName, category, type) {
  if (appName) {
    return [
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
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      )
    ];
  } else {
    return [
      Text(
        category,
        style: TextStyle(
            color: Color.fromRGBO(1, 138, 22, 1),
            fontSize: (type != null || category.length > 8) ? 18 : 25,
            fontWeight: FontWeight.bold),
      ),
      Text(
        type == null ? "" : type,
        style: TextStyle(
            color: Colors.black,
            fontSize: category.length < 5 ? 20 : 22,
            fontWeight: FontWeight.bold),
      )
    ];
  }
}
