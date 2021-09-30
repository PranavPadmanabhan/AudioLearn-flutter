import 'dart:convert';
import 'dart:developer';

import 'package:audio_learn/components/CustomTextField.dart';
import 'package:audio_learn/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum AuthState { LOGIN, SIGNUP }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  AuthState authState = AuthState.LOGIN;
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  toggleAuthState() {
    if (authState == AuthState.LOGIN) {
      setState(() {
        authState = AuthState.SIGNUP;
      });
    } else {
      setState(() {
        authState = AuthState.LOGIN;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  login(email, password) async {
    var url =
        Uri.parse("http://192.168.113.72:8000/contentmanagement/api/token/");
    http.Response response = await http
        .post(url, body: {"emailorphone": email, "password": password});
    var userData = jsonDecode(response.body);
    print(userData['token']);
    if (userData['token'] != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  toggleScreen() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (authState == AuthState.LOGIN) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Asset-2.png"),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: height * 0.17,
                width: width * 0.5,
                margin: EdgeInsets.only(bottom: height * 0.05),
                child: Image(image: AssetImage("assets/images/Asset1.png"))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                    textEditingController: emailController,
                    hintText: "Email",
                    obscureText: false),
                CustomTextField(
                    textEditingController: passwordController,
                    hintText: "Password",
                    obscureText: true),
                Container(
                    margin: EdgeInsets.only(
                      left: width * 0.08,
                    ),
                    width: width,
                    height: 50,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.grey.shade500),
                            )))),
                GestureDetector(
                  onTap: () {
                    var email = emailController.text.trim();
                    var pass = passwordController.text.trim();
                    login(email, pass);
                  },
                  child: Container(
                    width: width * 0.45,
                    height: 45,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(1, 138, 22, 1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    toggleAuthState();
                  },
                  child: Container(
                    width: width * 0.4,
                    height: 30,
                    margin: EdgeInsets.only(top: height * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ]),
                    child: Center(
                      child: Text(
                        "create Account",
                        style: TextStyle(
                            color: Color.fromRGBO(1, 138, 22, 1),
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Asset-2.png"),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: height * 0.12,
                width: width * 0.5,
                margin: EdgeInsets.only(bottom: height * 0.02),
                child: Image(image: AssetImage("assets/images/Asset1.png"))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                    textEditingController: fullnameController,
                    hintText: "FullName",
                    obscureText: false),
                CustomTextField(
                    textEditingController: emailController,
                    hintText: "Email",
                    obscureText: true),
                CustomTextField(
                    textEditingController: phoneController,
                    hintText: "PhoneNo",
                    obscureText: true),
                CustomTextField(
                    textEditingController: passwordController,
                    hintText: "Password",
                    obscureText: true),
                Container(
                  width: width * 0.45,
                  height: 45,
                  margin: EdgeInsets.only(
                    top: height * 0.02,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(1, 138, 22, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.symmetric(vertical: height * 0.015),
                  child: Center(
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    toggleAuthState();
                  },
                  child: Container(
                    width: width * 0.45,
                    height: 30,
                    margin: EdgeInsets.only(top: height * 0.015),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ]),
                    child: Center(
                      child: Text(
                        "Already have an Account",
                        style: TextStyle(
                            color: Color.fromRGBO(1, 138, 22, 1),
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(body: toggleScreen());
  }
}
