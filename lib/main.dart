import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FencingApp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: Border(
              bottom: BorderSide(
            color: Colors.grey,
            width: 0.7,
          )),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(),
      ),
    );
  }
}
