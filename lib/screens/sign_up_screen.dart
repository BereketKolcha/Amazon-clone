import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    addresscontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.8,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign-Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 33,
                              ),
                            ),
                            TextFielWidget(
                              title: "Name",
                              hintText: "Enter your Name",
                              controller: namecontroller,
                              obscureText: false,
                            ),
                            TextFielWidget(
                              title: "Address",
                              hintText: "Enter your Address",
                              controller: addresscontroller,
                              obscureText: false,
                            ),
                            TextFielWidget(
                              title: "Email",
                              hintText: "Enter your Email",
                              controller: emailcontroller,
                              obscureText: false,
                            ),
                            TextFielWidget(
                              title: "Password",
                              hintText: "Enter your password",
                              controller: passwordcontroller,
                              obscureText: true,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                color: const Color(0xfffed813),
                                isLoading: false,
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    letterSpacing: 0.6,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomMainButton(
                    color: const Color.fromARGB(255, 212, 212, 212),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isLoading: false,
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.black,
                      ),
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
}
