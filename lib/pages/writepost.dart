import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void createData() {
  final userCollectionReference =
      FirebaseFirestore.instance.collection('posts');
  userCollectionReference.doc().set({'writer': '글쓰니', 'content': '글 썼다.'});
}

class WritePost extends StatelessWidget {
  const WritePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [TextButton(onPressed: () {}, child: Text('등록'))],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('등록'),
          onPressed: createData,
        ),
      ),
    );
  }
}
