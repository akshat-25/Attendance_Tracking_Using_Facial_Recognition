import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/login_widget_student.dart';
import 'package:signin_app/login_widget_teacher.dart';
import 'package:signin_app/signup_widget.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // SizedBox(
              //   height: w * 0.2,
              // ),
            ]),
            Container(
              width: w * .9,
              height: h * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/studentsoone.png"))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Text(
                        "Welcome!",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 22),
                    child: Text(
                      'Choose an option to proceed furthur',
                      style: GoogleFonts.lato(
                        color: Colors.grey.shade400,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: h * 0.12,
            ),
            Column(
              children: [
                InkWell(
                  radius: 30,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginWidgetStudent(onClickedSignup: () {}))),
                  child: Container(
                    width: w * 0.9,
                    height: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage("img/studentbtn.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: Text(
                        "Login as Student",
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  radius: 30,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginWidget(
                                onClickedSignup: () {},
                              ))),
                  child: Container(
                    // color: Colors.green,
                    width: w * 0.9,
                    height: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage("img/studentbtn.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: Text(
                        "Login as Teacher",
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
