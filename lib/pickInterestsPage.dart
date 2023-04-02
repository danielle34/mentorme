import 'package:flutter/material.dart';
import 'package:mentornet/mainTopicPage.dart';

class pickInterestsPage extends StatefulWidget {
  const pickInterestsPage({Key? key}) : super(key: key);

  @override
  _pickInterestsPage createState() => _pickInterestsPage();
}

class _pickInterestsPage extends State<pickInterestsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> wordsToShow = [
      "Financial",
      "Technology",
      "Business",
      "Education",
      "Health",
      "Sustainabilty"
    ];
    return Scaffold(
      body: Column(
        children: [
Container(height: 200,),
          Center(child: Container(
            height: 200,
            width: 400,
            child: Text(" WHAT WHOULD YOU LIKE TO LEARN TODAY?",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
          ),),
          Expanded(
            child: GridView.count(
              childAspectRatio: (1 / .4),
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: makeOptions(wordsToShow),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> makeOptions(listsOfStuff) {
    List listOptions = listsOfStuff;
    List<Widget> listStuff = [];
    for (var i = 0; i < listOptions.length; i++) {
      listStuff.add(
        SizedBox(
          height: 30,
          width: 40,
          child: TextButton(
            onPressed: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => mainTopicPage(listOptions[i]),
                  ));
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)))),
            child: Text(
              listOptions[i],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return listStuff;
  }
}
