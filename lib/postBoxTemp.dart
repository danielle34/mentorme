import 'package:flutter/material.dart';
import 'package:mentornet/videoTempPage.dart';
import 'dart:async';
import 'dart:io';


import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
class postBoxTemp extends StatefulWidget {
  postBoxTemp(this.theTopic);

  String theTopic;

  @override
  _postBoxTemp createState() => _postBoxTemp();
}

class _postBoxTemp extends State<postBoxTemp> {
  @override
  final userControl = TextEditingController();


  XFile? file;

  dynamic pickerFunction(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    file = image;
    setState(() {});
  }

//XFile replaces PickedFile
// ImagePicker.getImage replaces ImagePicker().pickImage

  @override
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
  }
}
