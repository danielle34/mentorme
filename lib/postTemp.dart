import 'package:flutter/material.dart';
import 'package:mentornet/postBoxTemp.dart';
class postTemp extends StatefulWidget {
  postTemp(this.theTopic);

  String theTopic;

  @override
  _postTemp createState() => _postTemp();
}

class _postTemp extends State<postTemp> {
  @override
  final userControl = TextEditingController();

  Widget build(BuildContext context) {

    //return postBoxTemp("hi");
    return Scaffold(

      body: Column(
        children: [
          Expanded(

            child: ListView.builder(

                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, i) {
                  return postBoxTemp("hi");
                }),


          ),

        ],
      ),
    );
  }
}
