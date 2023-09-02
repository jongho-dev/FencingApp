import 'package:flutter/material.dart';
// 파이어베이스 패키지
import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// 페이지 IMPORT
import 'pages/login/login.dart';
import 'pages/home.dart';
import 'pages/post.dart';
import 'pages/message.dart';
import 'pages/settings.dart';

// 메인 함수
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FencingApp',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.hasData) {
                return MainPage();
              } else {
                return LoginPage();
              }
            }));
  }
}

// 메인 페이지 위젯
class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final pages = [HomePage(), PostPage(), MessagePage(), SettingsPage()];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.65),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: '게시글',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.markunread),
              label: '쪽지',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: '더보기',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue[500],
          onTap: onItemTapped,
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          unselectedItemColor: Colors.grey[500],
        ),
      ),
    );
  }
}
