import 'package:flutter/material.dart';
//import 'package:unitone/pages/appDrawer.dart';
import 'package:unitone/pages/ImageList.dart';

class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  //image data
  var data;
  var name;
  List<String> imgUrl = <String>[];
  List<String> imgTitle = <String>[];
  List<String> imgUserImage = <String>[];

  _assign(data) {
    //print(data);
    //print("-------------------------------------------");
    //print(data["data"]["results"]);
    var dd = data["data"]["results"];
    //print(dd.length);
    for (int i = 0; i < dd.length; i++) {
      imgUrl.add(dd[i]["urls"]["regular"]);
      imgTitle.add(dd[i]["user"]["name"]);
      imgUserImage.add(dd[i]["user"]["profile_image"]["small"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Bottom navBar
    // ignore: non_constant_identifier_names
    BottomAppBar BottomNavBar(BuildContext context) {
      return new BottomAppBar(
        color: Colors.grey[400],
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context, "/home");
              },
              icon: Icon(Icons.home),
            ),
          ],
        ),
      );
    }

    data = ModalRoute.of(context).settings.arguments;
    name = data["name"];
    //print(name);
    _assign(data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text("$name", style: TextStyle(color: Colors.white)),
          ),
        ),
        //drawer: AppDrawer(),
        body: ImageList(
            imgUrl: imgUrl, imgTitle: imgTitle, imgUserImage: imgUserImage),
        //Bottom Navigator
        bottomNavigationBar: BottomNavBar(context));
  }
}
