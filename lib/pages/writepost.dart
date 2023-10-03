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
        appBar: AppBar(
          title: Center(
            child: Text(
              '게시물 작성',
              style: TextStyle(color: Colors.black),
            ),
          ),
          elevation: 0.0,
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
        body: Column(children: [
          TextField(
            controller: _titlecontroller,
            decoration: InputDecoration(
              hintText: "제목",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0)),
            ),
          ),
          TextField(
            controller: _contentcontroller,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "내용",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0)),
            ),
          ),
        ]),
      ),
    );
  }
}
