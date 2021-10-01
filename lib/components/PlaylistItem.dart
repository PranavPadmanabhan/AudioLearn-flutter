import 'package:flutter/material.dart';

Widget PlayListItem({required name, context, required playing}) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    padding: EdgeInsets.only(left: 20, right: 20),
    width: width * 0.8,
    height: 70,
    decoration: BoxDecoration(
        color: playing ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(40)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: playing
              ? AssetImage("assets/images/W.png")
              : AssetImage("assets/images/ic4.png"),
          width: playing ? 22 : 30,
        ),
        Text(name.toString()),
        Image(
          image: playing
              ? AssetImage("assets/images/strt-buton.png")
              : AssetImage("assets/images/pse-button.png"),
          width: 30,
        )
      ],
    ),
  );
}
