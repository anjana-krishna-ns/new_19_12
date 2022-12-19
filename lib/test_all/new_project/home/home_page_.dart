
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../screens/Cart/cart_screen.dart';
import '../../../screens/Home_page/detailPage/detail_1.dart';
import '../../../screens/Home_page/detailPage/detail_2.dart';
import '../../../screens/Home_page/detailPage/detail_3.dart';
import '../../../screens/Home_page/detailPage/detail_4.dart';
import '../../../screens/Home_page/detailPage/detail_air_4.dart';
import '../../../screens/Home_page/detailPage/detail_6.dart';
import '../../../screens/Wish_list/wishPage.dart';
import '../../../screens/profile_page/profile_1.dart';
import '../Sign_in/log_in.dart';
import '../sign_out/sign_out_.dart';
class HomePage_new extends StatefulWidget {
  @override
  _HomePage_newState createState() => _HomePage_newState();
}

class _HomePage_newState extends State<HomePage_new> {
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
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          ('Arche'),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Wish()));
              },
              icon: Icon(Icons.favorite)),
          Padding(padding: EdgeInsets.all(5)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartPage()));
              },
              icon: Icon(Icons.shopping_cart_rounded)),
        ],
      ),
      body: SafeArea(
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
            scrollDirection: Axis.vertical,
            primary: false,
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/orgg1.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage2()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org2.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage3()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org3.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage4()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org4.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage5()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org5.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage6()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org6.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage6()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org6.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage6()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org6.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ]
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                //  backgroundImage: NetworkImage(imageUrl!),
                radius: 40,
              ),),
            ListTile(
              title: const Text('My account'),
              leading: Icon((Icons.person), size: 20, color: Colors.black54),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => My_profile()));
              },
            ),
            ListTile(
              title: const Text('My cart'),
              leading: Icon((Icons.shopping_cart_outlined),
                  size: 20, color: Colors.black54),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartPage()));
              },
            ),
            ListTile(
              leading: Icon((Icons.favorite), size: 20, color: Colors.black54),
              title: const Text('My wishlist'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Wish()));
              },
            ),
            ListTile(
              title: const Text('My orders'),
              leading: Icon(
                (Icons.shopping_bag),
                size: 20,
                color: Colors.black54,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartPage()));
              }, //look this<3
            ), ListTile(
              title: const Text('log out'),
              leading: Icon(
                (Icons.logout),
                size: 20,
                color: Colors.black54,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Sig_out_()));
              }, //look this<3
            ),
          ],
        ),
      ),
    );
  }
}