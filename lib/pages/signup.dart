import 'package:flutter/material.dart';
import '../components/textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
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
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10.0),
                SignupTextfield(
                    label: '사용하실 이메일 주소를 입력해주세요.',
                    isPW: false,
                    onPressed: () {}),
                SizedBox(height: 20.0),
                Text(
                  '비밀번호',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10.0),
                SignupTextfield(
                    label: '6자 이상 입력해주세요.', isPW: true, onPressed: () {}),
                SizedBox(height: 40.0),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(0, 100, 255, 1))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
