import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
  String email = '';

  final _emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async=>false ,
      child: Scaffold(
        body: Center(
          child: Container(
            height: size.height,
            width: size.height,
            child: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.025),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () =>
                                    Navigator.pop(context), //go back to authPage
                                child: Icon(
                                  Icons.arrow_back,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                  size: size.height * 0.03,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.015,
                                ),
                                // child: Text(
                                //   'Back',
                                //   style: GoogleFonts.poppins(
                                //       fontSize: size.height * 0.018,color: Colors.black
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.05,
                            left: size.width * 0.055,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Reset password',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: size.height * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.055),
                          child: Align(
                            child: Text(
                              "Forgot your password? That's okay, it happens to everyone!\nPlease provide your email to reset your password.",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ),
                        ),
                        Form(
                          child: buildTextField(
                            "Email",
                            Icons.email_outlined,
                            false,
                            size,
                                (valuemail) {
                              if (valuemail.length < 5) {
                                buildSnackError(
                                  'Invalid email',
                                  context,
                                  size,
                                );
                                return '';
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                  .hasMatch(valuemail)) {
                                buildSnackError(
                                  'Invalid email',
                                  context,
                                  size,
                                );
                                return '';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: StadiumBorder()),
                            onPressed: (){},
                            child: Text(" Send instructions",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.08),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;
  Widget buildTextField(
      String hintText,
      IconData icon,
      bool password,
      size,
      FormFieldValidator validator,
      ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Form(
          key: _emailKey,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            keyboardType: TextInputType.emailAddress,
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pwVisible = !pwVisible;
                    });
                  },
                  child: pwVisible
                      ? const Icon(
                    Icons.visibility_off_outlined,
                    color: Color(0xff030303),
                  )
                      : const Icon(
                    Icons.visibility_outlined,
                    color: Color(0xff030303),
                  ),
                ),
              )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}