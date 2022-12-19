//
// import'package:flutter/material.dart';
//
// import '../../../screens/Home_page/firebase.dart';
// import '../../sign_inn/first.dart';
// import '../sign+in.dart';
//
//
// class LoginPage_trng extends StatefulWidget {
//   @override
//   _LoginPage_trngState createState() => _LoginPage_trngState();
// }
//
// class _LoginPage_trngState extends State<LoginPage_trng> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               FlutterLogo(size: 150),
//               SizedBox(height: 50),
//               _signInButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _signInButton() {
//     return OutlinedButton(
//       //splashColor: Colors.grey,
//       onPressed: () {
//         signInWithGoogle().then((result) {
//           if (result != null) {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return FirstScreen();
//                 },
//               ),
//             );
//           }
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image(image: AssetImage("assets/images/google.png"), height: 35.0),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.grey,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }