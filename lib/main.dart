import 'package:flutter/material.dart';
import 'package:unitone/pages/home.dart';
import 'package:unitone/pages/loading.dart';
import 'package:unitone/pages/collections.dart';
import 'package:unitone/pages/images.dart';
import 'package:unitone/pages/aboutUs.dart';
//import 'package:unitone/pages/imageList.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    "/": (context) => Loading(),
    "/home": (context) => Home(),
    "/collections": (context) => Collections(),
    "/images": (context) => Images(),
    "/about": (context) => AboutUs(),
  }));
}
