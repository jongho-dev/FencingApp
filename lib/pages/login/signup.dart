import 'package:flutter/material.dart';
// 파이어베이스 패키지
import 'package:firebase_auth/firebase_auth.dart';
// 페이지 IMPORT
import 'loginbyemail.dart';
// 컴포넌트
import '../../components/textfield.dart';

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

// 사인업 페이지 위젯
class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // 파이어베이스 AUTH
  final _authentication = FirebaseAuth.instance;
  // 텍스트필드 컨트롤
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _pwcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _pwcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left, size: 42.0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20.0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '이메일로 회원가입',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              Text(
                '이메일',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              SignupTextfield(
                  label: '사용하실 이메일 주소를 입력해주세요.',
                  isPW: false,
                  controller: _emailcontroller,
                  keyboardtype: TextInputType.emailAddress,
                  onPressed: () {}),
              SizedBox(height: 20.0),
              Text(
                '비밀번호',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              SignupTextfield(
                label: '6자 이상 입력해주세요.',
                isPW: true,
                controller: _pwcontroller,
                keyboardtype: TextInputType.text,
                onPressed: () {},
              ),
              SizedBox(height: 40.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  child: Text(
                    '회원가입',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () async {
                    try {
                      final newUser =
                          await _authentication.createUserWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _pwcontroller.text,
                      );

                      if (newUser.user != null) {
                        Navigator.push(
                            context, FadeRoute(page: LoginByEmailPage()));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('이메일이나 비밀번호 형식을 다시 확인해주세요.')));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(0, 100, 255, 1))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
