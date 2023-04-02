import 'package:flutter/material.dart';
import 'package:mentornet/main.dart';
import 'package:mentornet/pickInterestsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/rendering.dart';

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
    _controller = VideoPlayerController.asset('assets/videos/People Talking at The Table _ Free Video Loop.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    _controller.play();

    getData();
    setState(() {});

    print("hereeeee");
    super.initState();
  }

  @override
  void dispose() {
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
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Center(

            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      ''),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            )
          ),
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
