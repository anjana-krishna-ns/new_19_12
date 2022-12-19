import 'dart:convert';
import 'package:arche_org/screens/Home_page/home.dart';
import 'package:arche_org/screens/profile_page/profile_1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Home_page/Navigation bar.dart';

class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  // final username_controller = TextEditingController();
  // final password_controller = TextEditingController();
  // late SharedPreferences logindata;
  // late bool newuser;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   check_if_already_login();
  // }
  // void check_if_already_login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   newuser = (logindata.getBool('login') ?? true);
  //   print(newuser);
  //   if (newuser == false) {
  //     Navigator.pushReplacement(
  //         context, new MaterialPageRoute(builder: (context) => My_profile()));
  //   }
  // }
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   username_controller.dispose();
  //   password_controller.dispose();
  //   super.dispose();
  // }
  final _form = GlobalKey<FormState>();
  String? name, phone, email, password, confirmPassword;

  void writeData() async {
    _form.currentState?.save();
    var url = "https://arche-close-default-rtdb.firebaseio.com/" + "lol.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _form,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                       width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Enter name"),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Enter Valid Name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value1) {
                          name = value1!;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: "Enter Phone Number"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid number';
                          }
                          if (value!.isEmpty ||
                              !RegExp(r'^(?:[+0]9)?[0-9]{10}$')
                                  .hasMatch(value)) {
                            return "Enter Valid number";
                          }
                          if (value.length < 10 || value.length > 10) {
                            return 'The number must be 10 digit';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value3) {
                          phone = value3!;
                        },
                      ),
                    ),
                    Container(
                      width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.mail), hintText: "Enter Email"),
                        validator: (valuemail) {
                          if (valuemail!.isEmpty) {
                            return 'feild cant be empty';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                              .hasMatch(valuemail!)) {
                            return 'invalid email';
                          }
                          return null;
                        },
                        onSaved: (value4) {
                          email = value4!;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            icon: Icon(Icons.remove_red_eye),
                            hintText: "Enter password"),
                        validator: (valuepassword) {
                          if (valuepassword!.isEmpty) {
                            return 'Enter your password';
                          }
                          if (valuepassword.length < 6) {
                            return 'Password must be more than 6 Letters';
                          }
                          if (valuepassword.length > 12) {
                            return 'Password must not be more than 12 Letters';
                          }
                          if (RegExp(
                                  r'^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$')
                              .hasMatch(valuepassword)) {
                            return null;
                          } else {
                            return "Password should Contain at least 1 symbol,Uppercase or number";
                          }
                        },
                        onSaved: (value5) {
                          password = value5!;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      width: 450,
                      margin: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            icon: Icon(Icons.remove_red_eye_outlined),
                            hintText: "Enter Confirm Password"),
                        validator: (valuepassword) {
                          if (valuepassword!.isEmpty) {
                            return 'Enter your password';
                          }
                          if (valuepassword.length < 6) {
                            return 'Password must be more than 6 Letters';
                          }
                          if (valuepassword.length > 12) {
                            return 'Password must not be more than 12 Letters';
                          }
                          if (RegExp(
                                  r'^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$')
                              .hasMatch(valuepassword)) {
                            return null;
                          } else {
                            return "Password should Contain at least 1 symbol,Uppercase or number";
                          }
                        },
                        onSaved: (value6) {
                          confirmPassword = value6!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black26,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                              color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          if (_form.currentState!.validate()) {
                            writeData();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Navbar1()));
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            )));
  }
}
