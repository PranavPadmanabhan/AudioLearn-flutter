import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CategoryListItem({required title, required bool active}) {
  return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: active ? Colors.green : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20)),
      height: 150,
      width: 150,
      child: Center(
        child: Text(title.toString(), style: TextStyle(fontSize: 15)),
      ));
}
