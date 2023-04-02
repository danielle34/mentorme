import 'package:flutter/material.dart';
import 'package:mentornet/postBoxTemp.dart';
class mainTopicPage extends StatefulWidget {
  mainTopicPage(this.theTopic);

  String theTopic;

  @override
  _mainTopicPage createState() => _mainTopicPage();
}

class _mainTopicPage extends State<mainTopicPage> {
  @override
  final userControl = TextEditingController();
  List<String> wordsToShow = [
    "Financial",
    "Technology",
    "Business",
    "Education"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        Container(height: 100,),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),

          child: Text(widget.theTopic,
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: 300,
                height: 100,
                child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: userControl,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onSubmitted: (value) {},
                    onChanged: (value) {
                      setState(() {});

                    }),
              ),
            ),



            Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: 100,
                height: 100,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),

                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {});
                  },
                  child: Text(
                    'go',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
Padding(
  padding: EdgeInsets.all(10),
child:         Text(
  'Searching for ${userControl.text}',
  style: TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
),


),
        //This will be the posts
        Expanded(

          child: ListView.builder(

              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) {
                return postBoxTemp("hi");
              }),


        ),


      ],),
    );
  }
}
