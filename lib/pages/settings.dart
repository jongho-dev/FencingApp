import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  final tablist = [
    {
      "title": "도움말",
    },
    {
      "title": "다크 모드",
    },
    {
      "title": "계정 설정",
    },
    {
      "title": "결제 내역",
    },
    {
      "title": "로그아웃",
    }
  ];

  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          title: Text(
            '설정',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: tablist.length,
          itemBuilder: (context, index) {
            var name = tablist[index]["title"];
            return GestureDetector(
                onTap: () {
                  if (name == '로그아웃') {
                    _authentication.signOut();
                  }
                },
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('$name'),
                  ),
                ));
          },
        ));
  }
}
