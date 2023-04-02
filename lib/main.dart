import 'package:flutter/material.dart';
import 'package:mentornet/logInPage.dart';
import 'package:mentornet/postTemp.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: LogInPage(),
      //home:postTemp("Tech"),
    );
  }
}
