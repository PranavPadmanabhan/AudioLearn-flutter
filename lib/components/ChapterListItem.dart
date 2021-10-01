import 'package:flutter/material.dart';

Widget ChapterListItem({context, required name}) {
  var width = MediaQuery.of(context).size.width;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: width * 0.95,
    height: 60,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(-5, 5))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Center(
            child: Text(name),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green,
              size: 24,
            ),
          ),
        )
      ],
    ),
  );
}
