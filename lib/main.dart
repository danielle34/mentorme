import 'package:flutter/material.dart';
import 'package:mentornet/logInPage.dart';
import 'package:mentornet/postTemp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
