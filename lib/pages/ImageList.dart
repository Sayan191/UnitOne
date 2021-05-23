import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageList extends StatefulWidget {
  final List<String> imgUrl;
  final List<String> imgTitle;
  final List<String> imgUserImage;
  ImageList({this.imgUrl, this.imgTitle, this.imgUserImage});

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    //print(widget.imgUserImage);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.imgUrl.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 4.0,
                  ),
                  child: ImageCard(
                    imageUrl: widget.imgUrl[index],
                    imageTitle: widget.imgTitle[index],
                    imageUser: widget.imgUserImage[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String imageTitle;
  final String imageUser;
  const ImageCard({Key key, this.imageUrl, this.imageTitle, this.imageUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 1.0),
              child: ListTile(
                  title: Text(
                    imageTitle,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imageUser),
                  ))),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                imageUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
