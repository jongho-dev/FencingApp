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
      length: 3,
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
              )
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'MENU1'),
                Tab(text: 'MENU2'),
                Tab(text: 'MENU3'),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.redAccent,
            ),
          ),
          drawer: Drawer(),
          body: TabBarView(
            children: [
              Center(child: Text('Page1')),
              Center(child: Text('Page2')),
              Center(child: Text('Page3')),
            ],
          )),
    );
  }
}
