import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/list_view.dart';
import 'package:signin_app/page_one.dart';
import 'package:signin_app/show_data.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StartingPage()));
            });
          },
        ),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: w,
            height: h * 0.3,
            child: Column(children: [
              SizedBox(height: h * 0.18),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("img/userone.png"),
              ),
            ]),
          ),
          Container(
            width: w,
            // margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.lato(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  user.email!,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Container(),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                radius: 30,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListDates()));
                },
                child: Column(
                  children: [
                    Container(
                      width: w * 0.7,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage("img/studentbtn.png"),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Text(
                          "Show Attendance Records",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                radius: 30,
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: w * 0.7,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage("img/studentbtn.png"),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Text(
                          "Manage Time Table",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                radius: 30,
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StartingPage()));
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: w * 0.7,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage("img/studentbtn.png"),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Text(
                          "Sign Out",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Container(
          //   child: ElevatedButton(
          //       onPressed: () => Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) => ShowData())),
          //       child: Text('Show CSV Data')),
          // )
        ]),
      ),
    );
  }
}
