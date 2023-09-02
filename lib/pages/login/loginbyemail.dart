import 'package:flutter/material.dart';
// 파이어베이스 패키지
import 'package:firebase_auth/firebase_auth.dart';
// 페이지 IMPORT
import '../../main.dart';
import 'signup.dart';
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

// 이메일로 로그인 페이지 위젯
class LoginByEmailPage extends StatefulWidget {
  @override
  State<LoginByEmailPage> createState() => _LoginByEmailPageState();
}

class _LoginByEmailPageState extends State<LoginByEmailPage> {
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
                '이메일로 로그인',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              Text(
                '이메일',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              SignupTextfield(
                  label: '이메일 주소를 입력해주세요.',
                  isPW: false,
                  keyboardtype: TextInputType.emailAddress,
                  controller: _emailcontroller,
                  onPressed: () {}),
              SizedBox(height: 20.0),
              Text(
                '비밀번호',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              SignupTextfield(
                  label: '비밀번호를 입력해주세요.',
                  isPW: true,
                  keyboardtype: TextInputType.text,
                  controller: _pwcontroller,
                  onPressed: () {}),
              SizedBox(height: 40.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  child: Text(
                    '로그인',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () async {
                    try {
                      final newUser =
                          await _authentication.signInWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _pwcontroller.text,
                      );

                      if (newUser.user != null) {
                        // Navigator.push(context, FadeRoute(page: MainPage()));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => MainPage()),
                            (route) => false);
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('이메일 혹은 비밀번호를 다시 확인해주세요.')));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(0, 100, 255, 1))),
                ),
              ),
              SizedBox(height: 2.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      '비밀번호 찾기',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      '회원가입',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    onPressed: () {
                      Navigator.push(context, FadeRoute(page: SignUpPage()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
