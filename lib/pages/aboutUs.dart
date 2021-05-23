import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:unitone/pages/home.dart';

class AboutUs extends StatefulWidget {
  //const Instagram = Container()
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text('UnitOne')),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://static.wikia.nocookie.net/naruto/images/d/dd/Naruto_Uzumaki%21%21.png/revision/latest/scale-to-width-down/350?cb=20161013233552'),
                ),
              ),
              Divider(
                color: Colors.grey[800],
                height: 60.0,
              ),
              Text(
                'Arithematic Unit',
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              ),
              Divider(
                color: Colors.grey[800],
                height: 30.0,
              ),

              //Personnal
              SizedBox(
                  child: Card(
                      child: Column(
                children: [
                  Text(
                    "Developer",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  //Instgram Tile
                  Card(
                    child: ListTile(
                      onTap: () async {
                        await canLaunch(
                                "https://www.instagram.com/_arithematic_unit_/")
                            ? await launch(
                                "https://www.instagram.com/_arithematic_unit_/")
                            : throw 'Could not launch ';
                      },
                      title: Text(
                        "Instagram",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      subtitle: (Text(
                        "@_arithematic_unit_",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      )),
                      leading: FaIcon(FontAwesomeIcons.instagram),
                    ),
                  ),
                  //Unsplash Tile
                  Card(
                    child: ListTile(
                      onTap: () async {
                        await canLaunch("https://unsplash.com/@sanu19125")
                            ? await launch("https://unsplash.com/@sanu19125")
                            : throw 'Could not launch ';
                      },
                      title: Text(
                        "Unsplash",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      subtitle: (Text(
                        "@sanu19125",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      )),
                      leading: FaIcon(FontAwesomeIcons.unsplash),
                    ),
                  ),
                ],
              ))),
              Divider(
                color: Colors.grey[800],
                height: 30.0,
              ),

              //Source Code
              SizedBox(
                  child: Card(
                      child: Column(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () async {
                        await canLaunch("https://github.com/Sayan191/UnitOne")
                            ? await launch(
                                "https://github.com/Sayan191/UnitOne")
                            : throw 'Could not launch ';
                      },
                      title: Text(
                        "Github",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      subtitle: (Text(
                        "UnitOne is open-source, chech it out  on Github",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      )),
                      leading: FaIcon(FontAwesomeIcons.github),
                    ),
                  ),
                ],
              )))
            ],
          ),
        ),
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

// Text("Developer"),
//                   ListTile(
//                       title: Text(
//                         "Instagram",
//                         style: TextStyle(
//                           fontFamily: "Raleway",
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25.0,
//                           letterSpacing: 2.0,
//                         ),
//                       ),
//                       subtitle: (Text(
//                         "@_arithematic_unit_",
//                         style: TextStyle(
//                           fontFamily: "Raleway",
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12.0,
//                           letterSpacing: 2.0,
//                         ),
//                       )),
//                       leading: FaIcon(FontAwesomeIcons.instagram))