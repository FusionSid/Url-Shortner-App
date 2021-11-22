import 'package:http/http.dart';

void main() {
  postData("lol.com");
}

Future postData(String short) async {
  final url = "https://url-shortener.fusionsid.repl.co/api/";
  final response = await post(Uri.parse(url), body: {"url": short});
  print(response.body);
}