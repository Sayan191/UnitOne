import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
//import 'package:unitone/pages/appDrawer.dart';
import 'package:unitone/pages/ImageList.dart';
import 'package:unitone/services/Image_search.dart';
import 'package:unitone/services/collections.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //image datas
  var data;
  List<String> imgUrl = <String>[];
  List<String> imgTitle = <String>[];
  List<String> imgUserImage = <String>[];

  //SearchBar starts----------------------------------------------------------------

  void setupImage(String value) async {
    SearchResults instance = SearchResults(search: value);
    await instance.getData();
    //print(instance.data);

    Navigator.pushNamed(context, "/images",
        arguments: {"data": instance.data, "name": instance.name});
  }

  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        title: Text("UnitOne"),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setupImage(value);
  }

  _HomeState() {
    searchBar = SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: onSubmitted,
      buildDefaultAppBar: buildAppBar,
    );
  }
  //SearchBar ends-------------------------------------------------

  //collections navigation-----------------------------------------
  void getCollections() async {
    Collections instance = Collections();
    await instance.getCollections();
    //print(instance.data);
    Navigator.pushNamed(context, '/collections',
        arguments: {"data": instance.data});
  }
  //collections navigation-----------------------------------------

  //assigning data to lists----------------------------------------
  _assign(data) {
    var dd = data["data"];
    for (int i = 0; i < data["data"].length; i++) {
      imgUrl.add(dd[i]["urls"]["regular"]);
      imgTitle.add(dd[i]["user"]["name"]);
      imgUserImage.add(dd[i]["user"]["profile_image"]["small"]);
    }
  }
  //assigning data to lists----------------------------------------

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    _assign(data);
    //final appBar = new AppBar(title: new Text("data"));
    return Scaffold(
        appBar: searchBar.build(context),
        key: _scaffoldKey,
        drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                  // ignore: deprecated_member_use
                  child: RaisedButton.icon(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context, "/home");
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: Text("Home",
                          style: TextStyle(
                            color: Colors.white,
                          )))),
              // ListTiles

              //collections
              ListTile(
                  onTap: () {
                    getCollections();
                  },
                  title: Text("Collections"),
                  leading: Icon(Icons.category)),

              //About us
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/about");
                  },
                  title: Text("About Us"),
                  leading: Icon(Icons.contact_mail_rounded))
            ],
          ),
        ),
        body: ImageList(
            imgUrl: imgUrl, imgTitle: imgTitle, imgUserImage: imgUserImage),

        //Bottom Navigator
        bottomNavigationBar: BottomNavBar(context));
  }

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
}

//Tutorials
//https://www.youtube.com/watch?v=aaGcER1uUoE
//


