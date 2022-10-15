import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_app/signup_widget.dart';
import 'package:signin_app/utils.dart';
import 'package:signin_app/welcome_page.dart';
import 'auth_page.dart';
import 'login_widget_teacher.dart';
import 'package:signin_app/page_one.dart';

// import 'dart:html';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: Utils.messangerKey,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const StartingPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something Went Wrong !!'),
          );
        } else if (snapshot.hasData) {
          return WelcomePage();
        } else {
          return AuthPage();
        }
      }),
    ));
  }
}
