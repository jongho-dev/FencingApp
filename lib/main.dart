import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FencingApp',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
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
        body: TabBarView(
          children: [
            Center(child: Text('Home Page')),
            Center(child: Text('Edit Page')),
            Center(child: Text('Chatting Page')),
            Center(child: Text('Profile Page'))
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 80,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                text: '홈',
              ),
              Tab(
                icon: Icon(Icons.edit),
                text: '글',
              ),
              Tab(
                icon: Icon(
                  Icons.chat_bubble,
                  size: 21,
                ),
                text: '채팅',
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  size: 27,
                ),
                text: '프로필',
              ),
            ],
            labelColor: Colors.redAccent,
            labelStyle: TextStyle(fontSize: 14),
            indicatorColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
