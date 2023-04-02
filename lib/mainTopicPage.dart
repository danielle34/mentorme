import 'package:flutter/material.dart';
import 'package:mentornet/postBoxTemp.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mentornet/openAIData.dart';

class mainTopicPage extends StatefulWidget {
  mainTopicPage(this.theTopic);

  String theTopic;

  @override
  _mainTopicPage createState() => _mainTopicPage();
}
GptData gptDataFromJson(String str) => GptData.fromJson(json.decode(str));

String gptDataToJson(GptData data) => json.encode(data.toJson());


class _mainTopicPage extends State<mainTopicPage> {
  @override
  String apiKey = "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";

  Future<List> getChatWorking(String thePrompt) async{
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    var url = Uri.parse('https://api.openai.com/v1/completions');

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Authorization': 'Bearer $apiKey'
    };



    print(thePrompt);
    final data = jsonEncode({
      "model": "text-davinci-003",
      "prompt": thePrompt,
      "temperature": 0.2,
      "max_tokens": 100,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    });
    var response = await http.post(url, headers: headers, body: data);
    //print(json.decode(response));
    print(response.toString());
    print("oh>>");


    fromJson(Map<String, dynamic> json) => GptData(
      id: json["id"],
      object: json["object"],
      created: json["created"],
      model: json["model"],
      choices:
      List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      usage: Usage.fromJson(json["usage"]),
    );

    final gptData = gptDataFromJson(response.body);

    String gptDataToJson(GptData data) => json.encode(data.toJson());
    print(gptData.choices[0].text);
    print(gptDataToJson);

    return [];

  }











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
                    getChatWorking("On scale of 0-1 how similar are the sentences \" the cat in the hat\" and \"boy with cat\"");
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
