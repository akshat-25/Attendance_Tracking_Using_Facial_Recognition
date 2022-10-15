import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/signup_widget.dart';
import 'package:signin_app/utils.dart';
import 'package:signin_app/welcome_page.dart';
import 'forgot_password_page.dart';
import 'main.dart';

class LoginWidgetStudent extends StatefulWidget {
  final VoidCallback onClickedSignup;
  const LoginWidgetStudent({
    Key? key,
    required this.onClickedSignup,
  }) : super(key: key);

  @override
  State<LoginWidgetStudent> createState() => _LoginWidgetStudentState();
}

class _LoginWidgetStudentState extends State<LoginWidgetStudent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: w * 0.1,
            ),
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/studentspng.png"),
                      fit: BoxFit.fitWidth)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Student! ",
                      style: GoogleFonts.lato(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Sign into your account",
                        style: GoogleFonts.lato(
                          color: Colors.grey.shade400,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'Email or username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password_outlined,
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                          child: Text(
                            "Forgot Your Password ?",
                            style: GoogleFonts.lato(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage())),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          radius: 30,
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) =>
                                    Center(child: CircularProgressIndicator()));
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim())
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomePage()));
                            });
                          },
                          child: Container(
                            width: w * 0.6,
                            height: h * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage("img/studentbtn.png"),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // RichText(
                    //     text: TextSpan(
                    //   recognizer: TapGestureRecognizer()
                    //     ..onTap = widget.onClickedSignup,
                    //   style: TextStyle(
                    //     color: Colors.green,
                    //   ),
                    //   text: 'Don\'t have an account ?',
                    // )),
                    // Center(
                    //   child: RichText(
                    //       text: TextSpan(
                    //           style: TextStyle(color: Colors.black),
                    //           text: 'Don\'t have an account ?',
                    //           children: [
                    //         TextSpan(
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = widget.onClickedSignup,
                    //           text: 'Create',
                    //           style: TextStyle(
                    //               decoration: TextDecoration.underline,
                    //               color: Colors.green,
                    //               fontWeight: FontWeight.bold),
                    //         )
                    //       ])),
                    // ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

//   Future signIn() async {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Center(child: CircularProgressIndicator()));
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       Utils.showSnackBar(e.message);
//     }
//     // Navigator.of(context) not working!
//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }
}
