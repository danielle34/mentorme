import 'package:flutter/material.dart';
import 'package:mentornet/postBoxTemp.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mentornet/openAIData.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

class mainTopicPage extends StatefulWidget {
  mainTopicPage(this.theTopic);

  String theTopic;

  @override
  _mainTopicPage createState() => _mainTopicPage();
}



//GptData gptDataFromJson(String str) => GptData.fromJson(json.decode(str));

//String gptDataToJson(GptData data) => json.encode(data.toJson());

class GptData {
  GptData ({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;

  factory  GptData.fromJson(Map<String, dynamic> json) =>  GptData(
    id: json["id"] as String ?? '',
    object: json["object"],
    created: json["created"],
    model: json["model"],
    choices:
    List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    usage: Usage.fromJson(json["usage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "created": created,
    "model": model,
    "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
    "usage": usage?.toJson(),
  };


}

class Choice {
  Choice({
    required this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
  });

  String text;
  int index;
  dynamic logprobs;
  String finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    text: json["text"],
    index: json["index"],
    logprobs: json["logprobs"],
    finishReason: json["finish_reason"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "index": index,
    "logprobs": logprobs,
    "finish_reason": finishReason,
  };
}

class Usage {
  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  int promptTokens;
  int completionTokens;
  int totalTokens;

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
    promptTokens: json["prompt_tokens"],
    completionTokens: json["completion_tokens"],
    totalTokens: json["total_tokens"],
  );

  Map<String, dynamic> toJson() => {
    "prompt_tokens": promptTokens,
    "completion_tokens": completionTokens,
    "total_tokens": totalTokens,
  };
}








class _mainTopicPage extends State<mainTopicPage> {
  @override
  String apiKey =  "ZRbeiCh5SiwdPZxXqeFQT3BlbkFJo4jcfgdFZPX7H0yCgtsy";




  GptData? gptDataFromJson;//(String str) => GptData.fromJson(json.decode(str));

  String gptDataToJsonl="null";//(GptData data) => json.encode(data.toJson());

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
      "max_tokens": 60,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    });
    var response = await http.post(url, headers: headers, body: data);
    //print(json.decode(response));
    print(response.toString());
    print("oh>>");
    gptDataFromJson( String str) =>  GptData.fromJson(json.decode(str));
print(response.body);
    final gptData = await gptDataFromJson(await response.body);

    String gptDataToJson(GptData data) =>  json.encode(data.toJson());
    print(gptData.choices[0].text);
    print(gptDataToJson);
setState(() {

});
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
                    getChatWorking("On scale of 0-1 how similar are the sentences \" how to save money\" and \"tips on saving\"");
                    setState(() {});
                    //userControl.text
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
