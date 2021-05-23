import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageLoad {
  //variable
  List data;

  Future<void> getData() async {
    try {
      //making request and getting data
      Uri uri = Uri.parse(
          "https://api.unsplash.com/photos/?per_page=60&client_id=kB1q7YBk0K1NmobnbDydSEq8qGoaHg3KKU6p6qn8lsQ");
      http.Response response = await http.get(uri);
      data = json.decode(response.body);
      //daata we got back
      //print(data);
    } catch (e) {
      print("Error Caught: " + e);
    }
  }
}
