// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

void main() {
  return runApp(MyApp());
}

void postData() async {
  final url = "https://url-shortener.fusionsid.repl.co/api/";
  final response = await post(Uri.parse(url), body: {"url": "instagram.com"});
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

class inputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(),
    );
  }
}