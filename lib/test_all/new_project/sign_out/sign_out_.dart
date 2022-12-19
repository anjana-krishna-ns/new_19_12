import 'package:flutter/material.dart';

import '../../../screens/Login/sign_in.dart';
import '../Sign_in/log_in.dart';
class Sig_out_ extends StatefulWidget {
  const Sig_out_({Key? key}) : super(key: key);

  @override
  State<Sig_out_> createState() => _Sig_out_State();
}

class _Sig_out_State extends State<Sig_out_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child:
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) =>signinn()));
          }, child: Text('Sign Out'))
      ),
    );
  }
}
