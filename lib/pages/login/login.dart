import 'package:flutter/material.dart';
// 페이지 IMPORT
import 'loginbyemail.dart';
// 컴포넌트
import '../../components/LoginButton.dart';

// 라우트 FADE ANIMATION
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

// 로그인 페이지 위젯
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildButton(context),
    );
  }

  // 버튼 UI
  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginButton(
            image: Image.asset('assets/glogo.png', width: 32.0, height: 32.0),
            text: Text('구글로 시작하기',
                style: TextStyle(color: Colors.black87, fontSize: 17.0)),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          LoginButton(
            image: Image.asset('assets/flogo.png', width: 30.0, height: 30.0),
            text: Text('페이스북으로 시작하기',
                style: TextStyle(color: Colors.white, fontSize: 17.0)),
            color: Color.fromRGBO(80, 114, 185, 1),
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          LoginButton(
            image: Icon(Icons.mail, size: 30.0),
            text: Text('이메일로 시작하기',
                style: TextStyle(color: Colors.white, fontSize: 17.0)),
            color: Colors.green,
            onPressed: () {
              Navigator.push(context, FadeRoute(page: LoginByEmailPage()));
            },
          ),
        ],
      ),
    );
  }
}
