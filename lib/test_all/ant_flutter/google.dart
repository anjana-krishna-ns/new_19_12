// Flutter Sign-in buttons - FlutterAnt

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
class SignInPage_ant extends StatefulWidget {
  const SignInPage_ant({Key? key}) : super(key: key);

  @override
  State<SignInPage_ant> createState() => _SignInPage_antState();
}

class _SignInPage_antState extends State<SignInPage_ant> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SignInButton(
            Buttons.Google,
            onPressed: () {

            },
          ),
          Divider(),
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
            },
          ),
          Divider(),
          SignInButton(
            Buttons.FacebookNew,
            onPressed: () {
            },
          ),
          Divider(),
          SignInButton(
            Buttons.Apple,
            onPressed: () {
            },
          ),
          Divider(),
          SignInButton(
            Buttons.GitHub,
            text: "Sign up with GitHub",
            onPressed: () {
            },
            // Flutter Sign-in buttons - FlutterAnt

          ),
          Divider(),
          SignInButton(
            Buttons.Microsoft,
            text: "Sign up with Microsoft ",
            onPressed: () {
            },
          ),
          Divider(),
          SignInButton(
            Buttons.Twitter,
            text: "Use Twitter",
            onPressed: () {
            },
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.LinkedIn,
                mini: true,
                onPressed: () {
                },
              ),
              SignInButton(
                Buttons.Tumblr,
                mini: true,
                onPressed: () {
                },
              ),
              SignInButton(
                Buttons.Facebook,
                mini: true,
                onPressed: () {
                },
              ),
              SignInButtonBuilder(
                icon: Icons.email,
                text: "Ignored for mini button",
                mini: true,
                onPressed: () {
                },
                backgroundColor: Colors.cyan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Flutter Sign-in buttons - FlutterAnt