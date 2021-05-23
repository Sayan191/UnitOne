import 'package:flutter/material.dart';
import 'package:unitone/services/image_loading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupImage() async {
    ImageLoad instance = ImageLoad();
    await instance.getData();
    //print(instance.data);

    Navigator.pushReplacementNamed(context, "/home",
        arguments: {"data": instance.data});
  }

  @override
  void initState() {
    super.initState();
    setupImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 250.0),
              Text(
                "UnitOne",
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontFamily: "Raleway",
                ),
              ),
              SizedBox(height: 20.0),
              SpinKitDoubleBounce(
                color: Colors.black,
                size: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
