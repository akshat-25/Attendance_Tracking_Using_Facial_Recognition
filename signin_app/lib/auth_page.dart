import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signin_app/login_widget_teacher.dart';
import 'package:signin_app/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSignup: toogle)
      : SignupWidget(onClickedlogin: toogle);

  void toogle() => setState(() => isLogin = !isLogin);
}
