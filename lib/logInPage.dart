import 'package:flutter/material.dart';
import 'package:mentornet/main.dart';
import 'package:mentornet/pickInterestsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPage createState() => _LogInPage();
}
final firestoreInstance = FirebaseFirestore.instance;

class _LogInPage extends State<LogInPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {

    _controller = VideoPlayerController.network(
      'assets/videos/introVid',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.initialize().then((value){
      setState(() {});
    });
    _controller.setLooping(true);
    getData();
    setState(() {});

    print("hereeeee");
    super.initState();
  }

  @override
  void dispose() {
    //_controller.dispose();
    _controller.dispose();

    super.dispose();
  }



  void getData() async{
    //List_Posts.clear();

    await firestoreInstance.collection("posts").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        //print(result.data());
        print(result.data()["questions"]);

        //List_Posts.add(new postTemp(result.data()["text"]));
      });
    });

    setState(() {});
  }
  Future<bool> questionData(String theQuestion) async{
    List ListOfQuestions= [];

    await firestoreInstance.collection("posts").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        //print(result.data());
        ListOfQuestions.add(result.data()["questions"]);
        print(result.data()["questions"]);

      });
    });


    setState(() {});
    return true;
  }
  @override
  Widget build(BuildContext context) {
    final personName = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 100,),

          Center(
            child: Container(
              padding: EdgeInsets.all(0.0),
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(600),

                image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          // FutureBuilder(
          //   future: _initializeVideoPlayerFuture,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       // If the VideoPlayerController has finished initialization, use
          //       // the data it provides to limit the aspect ratio of the video.
          //       return AspectRatio(
          //         aspectRatio: _controller.value.aspectRatio,
          //         // Use the VideoPlayer widget to display the video.
          //         child: VideoPlayer(_controller),
          //       );
          //     } else {
          //
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),

          Container(
            padding: EdgeInsets.only(top: 0, left: 40),
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 400,
              height: 100,
              child: TextField(
                  controller: personName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  //https://www.tutorialkart.com/flutter/flutter-textfield/
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                  onSubmitted: (value) {
                    //do not do nothing
                    //https://stackoverflow.com/questions/54860198/detect-enter-key-press-in-flutter
                  },
                  onChanged: (value) {}),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 40),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 400,
              height: 100,
              child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  //https://www.tutorialkart.com/flutter/flutter-textfield/
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
                  onSubmitted: (value) {
                    //do not do nothing
                    //https://stackoverflow.com/questions/54860198/detect-enter-key-press-in-flutter
                  },
                  onChanged: (value) {}),
            ),
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

/*
too add the question in the data
firestoreInstance.collection("posts").add({
                      "text": "$postText",
                    }).then((value) {
                      print(value.id);
                    });
 */
