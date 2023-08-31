import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference product = FirebaseFirestore.instance.collection('posts');

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
        body: StreamBuilder(
          stream: product.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            print(streamSnapshot.hasError);
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      title: Text(documentSnapshot['content']),
                      subtitle: Text(documentSnapshot['writer']),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text('데이터 없음요'),
            );
          },
        )
        // body: ListView.builder(
        //   itemCount: postlist.length,
        //   itemBuilder: (context, index) {
        //     var name = postlist[index]["title"];
        //     return Container(
        //       height: 150,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           border:
        //               Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
        //       alignment: Alignment.topLeft,
        //       child: Padding(
        //         padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        //         child: Text(
        //           '$name',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 17,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
