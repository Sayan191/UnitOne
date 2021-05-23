import 'dart:convert';
import 'package:http/http.dart' as http;

class Collections {
  //variable
  List data;

  Future<void> getCollections() async {
    try {
      //making request and getting data
      Uri uri = Uri.parse(
          "https://api.unsplash.com/collections/?per_page=60&client_id=kB1q7YBk0K1NmobnbDydSEq8qGoaHg3KKU6p6qn8lsQ");
      http.Response response = await http.get(uri);
      data = json.decode(response.body);
      //data we got back
      //print(data);
    } catch (e) {
      print("Error Caught: " + e);
    }
  }
}
