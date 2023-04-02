import 'package:flutter/material.dart';
import 'package:mentornet/videoTempPage.dart';
class postBoxTemp extends StatefulWidget {
  postBoxTemp(this.theTopic);

  String theTopic;

  @override
  _postBoxTemp createState() => _postBoxTemp();
}

class _postBoxTemp extends State<postBoxTemp> {
  @override
  final userControl = TextEditingController();

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0.1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 500,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          ("Why do dogs bark so lound?"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),


                    Container(
                      height: 500,
                      width: 500,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, i) {
                           return videoBoxTemp("hi");

                          }),
                    ),
                  ]),
              Row(
                children: [
                  Text(
                    "Answer @mentornet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    //textAlign: TextAlign.left,
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
//     return Padding(
//       padding: EdgeInsets.all(30),
// child: Container(
//   height: 300,
//   child: Text("HEYYYYYY"),
// ),
  }
}
