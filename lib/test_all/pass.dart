
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
class pass extends StatefulWidget {
  const pass({Key? key}) : super(key: key);

  @override
  State<pass> createState() => _passState();
}

class _passState extends State<pass> {
  final TextEditingController controller = TextEditingController();
  bool success = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: success ? Colors.green : Colors.red,
          title: Column(
            children: const [
              Text("Password Validate"),
              Text(
                "@CodeWithFlexZ",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  success ? Icons.lock_open : Icons.lock_outline,
                  color: success ? Colors.green : Colors.red,
                  size: 130,
                ),
              ),
              SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 207, 207, 207),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              floatingLabelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: success ? Colors.green : Colors.red,
                                    width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Password",
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide()))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FlutterPwValidator(
                      controller: controller,
                      minLength: 8,
                      uppercaseCharCount: 2,
                      numericCharCount: 3,
                      specialCharCount: 1,
                      normalCharCount: 3,
                      width: 400,
                      height: 150,
                      onSuccess: () {
                        setState(() {
                          success = true;
                        });
                        print("MATCHED");
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Password is matched")));
                      },
                      onFail: () {
                        setState(() {
                          success = false;
                        });
                        print("NOT MATCHED");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}