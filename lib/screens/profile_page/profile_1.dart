// import 'package:flutter/material.dart';
// import '../../test_all/Login/sign+in.dart';
// import '../../test_all/sign_inn/sign.dart';
//
// class My_profile extends StatefulWidget {
//   const My_profile({Key? key}) : super(key: key);
//
//   @override
//   State<My_profile> createState() => _My_profileState();
// }
//
// class _My_profileState extends State<My_profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.blue, Colors.blue],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundImage: NetworkImage(
//                   imageUrl!,
//                 ),
//                 radius: 60,
//                 backgroundColor: Colors.transparent,
//               ),
//               SizedBox(height: 40),
//               Text(
//                 'NAME',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54),
//               ),
//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.deepPurple,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'EMAIL',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54),
//               ),
//               Text(
//                 email!,
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.deepPurple,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   signOutGoogle();
//                  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return My_signinn();}), ModalRoute.withName('/'));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Sign Out',
//                     style: TextStyle(fontSize: 25, color: Colors.white),
//                   ),
//                 ),
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:arche_org/screens/Home_page/firebase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_all/new_project/Sign_in/log_in.dart';
import '../../test_all/share_test/logout.dart';
import '../Login/sign_in.dart';
class My_profile extends StatefulWidget {
  @override
  _My_profileState createState() => _My_profileState();
}
class _My_profileState extends State<My_profile> {
  SharedPreferences ? logindata;
  String ?username;
  String ? email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      // email=logindata.getString('email')!;
      username = logindata?.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Welcome  $username',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  logindata!.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => signinn()));
                },
                child: Text('LogOut'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
