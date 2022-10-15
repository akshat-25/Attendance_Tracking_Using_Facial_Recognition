import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/login_widget_teacher.dart';
import 'package:signin_app/main.dart';
import 'package:signin_app/utils.dart';

class SignupWidget extends StatefulWidget {
  final Function() onClickedlogin;
  const SignupWidget({
    Key? key,
    required this.onClickedlogin,
  }) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final formKey = GlobalKey<FormState>();
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
    List images = ["g.png", "t.png", "f.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/signup.png"),
                        fit: BoxFit.cover)),
              ),
              // SizedBox(height: 5),
              // Container(
              //   child: CircleAvatar(
              //     radius: 40,
              //     backgroundColor: Colors.lightBlue,
              //     backgroundImage: AssetImage("img/profile1.png"),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Form(
                  key:
                      formKey, // USED TO MAKE VALIDATION WORK OF TEXTFORMFIELDS..
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Email or username',
                          // hintText: 'Email or username',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
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
                            prefixIcon: Icon(Icons.lock),
                            // hintText: 'Password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter minimum 6 chatacters'
                            : null,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextField(
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.password_rounded),
                      //       hintText: 'Confirm Password',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //       )),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                      signUp();
                    },
                    child: Container(
                      width: w * 0.5,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage("img/loginbtn.png"),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Text(
                          "Sign Up",
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
                height: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: 'Already have an account ?',
                      children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedlogin,
                      text: 'LogIn',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ])),
              SizedBox(
                height: 30,
              ),
              //       RichText(
              //           text: TextSpan(
              //         text: "Or sign up using ",
              //         style: TextStyle(color: Colors.grey.shade400, fontSize: 17),
              //       )),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Wrap(
              //         children: List<Widget>.generate(3, (index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: CircleAvatar(
              //               radius: 30,
              //               backgroundColor: Colors.grey.shade200,
              //               child: CircleAvatar(
              //                 radius: 25,
              //                 backgroundImage: AssetImage("img/" + images[index]),
              //               ),
              //             ),
              //           );
              //         }),
              //       )
            ],
          ),
        ));
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print('Error occured');
      print(e);
      Utils.showSnackBar(e.message);
    }
    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
