import 'package:flutter/material.dart';
// 파이어베이스 패키지
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

// 글쓰기 페이지 위젯
class WritePost extends StatefulWidget {
  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final user = FirebaseAuth.instance.currentUser;
  // 텍스트필드 컨트롤
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _contentcontroller = TextEditingController();
  bool isTitleExist = false;
  bool isContentExist = false;
  bool isBtnAble = false;

  @override
  void dispose() {
    _titlecontroller.dispose();
    _contentcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          title: Center(
            child: Text(
              '게시물 작성',
              style: TextStyle(color: Colors.black),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            TextButton(
              child: Text('등록',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (isBtnAble)
                        ? Colors.blue
                        : Color.fromARGB(255, 166, 215, 255),
                  )),
              onPressed: () {
                if (_titlecontroller.text.length > 0 &&
                    _contentcontroller.text.length > 0) {
                  final userCollectionReference =
                      FirebaseFirestore.instance.collection('posts');
                  userCollectionReference.doc().set({
                    'writer': user!.email,
                    'title': _titlecontroller.text,
                    'content': _contentcontroller.text,
                    'time': Timestamp.now()
                  });
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 10.0),
          child: Column(children: [
            TextField(
              controller: _titlecontroller,
              onChanged: (value) => {
                if (value.length == 0)
                  {
                    setState(() {
                      isTitleExist = false;
                    })
                  }
                else
                  {
                    setState(() {
                      isTitleExist = true;
                    })
                  },
                if (isTitleExist && isContentExist)
                  {
                    setState(() {
                      isBtnAble = true;
                    })
                  }
                else
                  {
                    setState(() {
                      isBtnAble = false;
                    })
                  }
              },
              decoration: InputDecoration(
                hintText: "제목",
                hintStyle: TextStyle(fontSize: 17),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.0), width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.0), width: 1.0)),
              ),
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(209, 209, 209, 1),
                          width: 1.0))),
            ),
            SizedBox(height: 2.0),
            TextField(
              controller: _contentcontroller,
              maxLines: null,
              onChanged: (value) => {
                if (value.length == 0)
                  {
                    setState(() {
                      isContentExist = false;
                    })
                  }
                else
                  {
                    setState(() {
                      isContentExist = true;
                    })
                  },
                if (isTitleExist && isContentExist)
                  {
                    setState(() {
                      isBtnAble = true;
                    })
                  }
                else
                  {
                    setState(() {
                      isBtnAble = false;
                    })
                  }
              },
              decoration: InputDecoration(
                hintText: "내용",
                hintStyle: TextStyle(fontSize: 17),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.0), width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.0), width: 1.0)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
