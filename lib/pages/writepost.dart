import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WritePost extends StatefulWidget {
  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final user = FirebaseAuth.instance.currentUser;
  // 텍스트필드 컨트롤
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _contentcontroller = TextEditingController();

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
          elevation: 0.0,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          title: Center(
            child: Text(
              '게시물 작성',
              style: TextStyle(color: Colors.black),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              child: Text('등록'),
              onPressed: () {
                final userCollectionReference =
                    FirebaseFirestore.instance.collection('posts');
                userCollectionReference.doc().set({
                  'writer': user!.email,
                  'title': _titlecontroller.text,
                  'content': _contentcontroller.text,
                  'time': Timestamp.now()
                });

                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(
                hintText: "제목",
                hintStyle: TextStyle(fontSize: 18),
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
                      bottom: BorderSide(color: Colors.grey, width: 1.0))),
            ),
            TextField(
              controller: _contentcontroller,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "내용",
                hintStyle: TextStyle(fontSize: 18),
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
