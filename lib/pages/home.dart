import 'package:flutter/material.dart';
// 파이어베이스 패키지
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './writepost.dart';
import './detailpost.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference product = FirebaseFirestore.instance.collection('posts');
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "${user?.email}",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder(
        stream: product.orderBy('time', descending: true).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          print(streamSnapshot.hasError);
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () =>
                      {Navigator.push(context, FadeRoute(page: DetailPost()))},
                  child: Card(
                    child: ListTile(
                      title: Text(documentSnapshot['title']),
                      subtitle: Text(documentSnapshot['writer']),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text('데이터 없음요'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add, size: 22.0),
        label: Text('글쓰기', style: TextStyle(fontSize: 20.0)),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, FadeRoute(page: WritePost()));
        },
      ),
    );
  }
}
