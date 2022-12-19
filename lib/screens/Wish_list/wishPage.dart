import 'package:arche_org/screens/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Wish extends StatefulWidget {
  const Wish({Key? key}) : super(key: key);

  @override
  State<Wish> createState() => _WishState();
}

class _WishState extends State<Wish> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false ,
      child: Scaffold(
       body:Column(
         children: [
           Row(
             children: [
               ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
               }, child: Text('Add To Cart'))
             ],
           )
         ],
       )
      ),
    );
  }
}
