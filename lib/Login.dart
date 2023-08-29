import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTheme(
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/glogo.png',
                    width: 32.0,
                    height: 32.0,
                  ),
                  Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.black87, fontSize: 17.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset(
                      'assets/glogo.png',
                      width: 32.0,
                      height: 32.0,
                    ),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size.fromHeight(50),
                elevation: 1.0,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/flogo.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                  Text(
                    'Login with Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset(
                      'assets/flogo.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(80, 114, 185, 1),
                minimumSize: Size.fromHeight(50),
                elevation: 1.0,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.mail,
                    size: 30.0,
                  ),
                  Text(
                    'Login with Email',
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset(
                      'assets/glogo.png',
                      width: 35.0,
                      height: 35.0,
                    ),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size.fromHeight(50),
                elevation: 1.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ));
  }
}
