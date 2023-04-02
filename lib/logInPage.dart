import 'package:flutter/material.dart';
import 'package:mentornet/main.dart';
import 'package:mentornet/pickInterestsPage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPage createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            ),
          Column(
            children: [


            ],
          ),

          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 400,
              height: 100,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pickInterestsPage(),
                      ));
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

        ]
        ),
    );
  }
}
