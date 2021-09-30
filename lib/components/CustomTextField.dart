import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.textEditingController,
      required this.hintText,
      required this.obscureText});
  var textEditingController = TextEditingController();
  var hintText;
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      width: width * 0.85,
      margin: EdgeInsets.only(top: height * 0.02),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Color.fromRGBO(1, 138, 22, 1), width: 1.5)),
      child: TextFormField(
        cursorColor: Colors.grey.shade300,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 25)),
      ),
    );
  }
}
