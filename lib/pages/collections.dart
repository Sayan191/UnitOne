import 'package:flutter/material.dart';
import 'package:unitone/pages/collectionList.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  //collections data
  var data;
  List<String> collectionUrl = <String>[];
  List<String> collectionTitle = <String>[];

  //assigning data to lists----------------------------------------
  _assign(data) {
    print(data);
    var dd = data["data"];
    for (int i = 0; i < dd.length; i++) {
      collectionUrl.add(dd[i]["cover_photo"]["urls"]["regular"]);
      collectionTitle.add(dd[i]["title"]);
      //imgUserImage.add(dd[i]["user"]["profile_image"]["small"]);
    }
  }
  //assigning data to lists----------------------------------------

  @override
  Widget build(BuildContext context) {
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
    //print(data);
    _assign(data);
    return Scaffold(
        body: CollectionList(
          collectionUrl: collectionUrl,
          collectionTitle: collectionTitle,
        ),
        //Bottom Navigator
        bottomNavigationBar: BottomNavBar(context));
  }
}
