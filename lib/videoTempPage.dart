import 'package:flutter/material.dart';

class videoBoxTemp extends StatefulWidget {
  videoBoxTemp(this.theTopic);

  String theTopic;

  @override
  _videoBoxTemp createState() => _videoBoxTemp();
}

class _videoBoxTemp extends State<videoBoxTemp> {
  @override
  final userControl = TextEditingController();

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          child: Text("hi",)
        ),
      ),
    );
  }
}
