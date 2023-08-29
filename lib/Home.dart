import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final postlist = [
    {
      "title": "첫번째 게시글",
    },
    {
      "title": "두번째 게시글",
    },
    {
      "title": "세번째 게시글",
    },
    {
      "title": "네번째 게시글",
    },
    {
      "title": "다섯번째 게시글",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: postlist.length,
        itemBuilder: (context, index) {
          var name = postlist[index]["title"];
          return Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Text(
                '$name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
