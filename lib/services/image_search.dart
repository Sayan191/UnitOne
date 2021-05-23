import "dart:convert";
import 'package:http/http.dart' as http;

class SearchResults {
  String search; //search name
  String name; //store name
  var data; //Store the image data

  SearchResults({this.search});

  Future<void> getData() async {
    try {
      Uri uri = Uri.parse(
          "https://api.unsplash.com/search/photos?query=$search&per_page=60&client_id=kB1q7YBk0K1NmobnbDydSEq8qGoaHg3KKU6p6qn8lsQ");
      http.Response response = await http.get(uri);
      data = json.decode(response.body);
      name = search;
      /*
      print("---------------------");
      print(data);
      print("---------------------");
      */
    } catch (e) {
      print(e);
    }
  }
}
