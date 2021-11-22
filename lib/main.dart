import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

void main() {
  postData("lol.com");
//  return runApp(MyApp());
}

Future postData(String short) async {
  final url = "https://url-shortener.fusionsid.repl.co/api/";
  final response = await post(Uri.parse(url), body: {"url": short});
  print(response.body);
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

class _inputWidgetState extends State<inputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
                decoration:
                    InputDecoration(hintText: "Url you want to shorten")),
            ElevatedButton(onPressed: () {}, child: Text("Submit")),
          ],
        ));
  }
}
