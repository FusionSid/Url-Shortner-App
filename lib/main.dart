import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

void main() {
  // postData("lol.com");
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Shorty")),
        body: inputWidget(),
      ),
    );
  }
}

class inputWidget extends StatefulWidget {
  const inputWidget({Key? key}) : super(key: key);

  @override
  _inputWidgetState createState() => _inputWidgetState();
}

Future postData(String short) async {
  const url = "https://url-shortener.fusionsid.repl.co/api/";
  final response = await post(Uri.parse(url), body: {"url": short});
  if (response.statusCode == 200) {
    String responseurl = response.body;
    return responseurl;
  } else {
    return null;
  }
}

class _inputWidgetState extends State<inputWidget> {
  final TextEditingController inputUrl = TextEditingController();
  String urlResponse = "";
  String urs = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("${urs}"),
            Linkify(text: "${urlResponse}"),
            TextField(
                controller: inputUrl,
                decoration:
                    InputDecoration(hintText: "Url you want to shorten")),
            ElevatedButton(
                onPressed: () async {
                  final inputurl = inputUrl.text;

                  String urlresponse = await postData(inputurl);

                  setState(() {
                    urlResponse = urlresponse;
                    urs = "Success!";
                    inputUrl.text = "";
                  });
                },
                child: Text("Submit")),
          ],
        ));
  }
}
