import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 0.0,
      shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
    ));
  }
}
