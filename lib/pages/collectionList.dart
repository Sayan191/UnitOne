import 'package:flutter/material.dart';
import 'package:unitone/services/Image_search.dart';

// ignore: must_be_immutable
class CollectionList extends StatefulWidget {
  List<String> collectionUrl = <String>[];
  List<String> collectionTitle = <String>[];
  CollectionList({this.collectionUrl, this.collectionTitle});

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  void setupImage(String value) async {
    SearchResults instance = SearchResults(search: value);
    await instance.getData();
    //print(instance.data);

    Navigator.pushNamed(context, "/images",
        arguments: {"data": instance.data, "name": instance.name});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Collections")),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.collectionUrl.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 1.0,
                        horizontal: 4.0,
                      ),
                      child: Card(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20.0, 0, 1.0),
                                child: ListTile(
                                    onTap: () {
                                      setupImage(widget.collectionTitle[index]);
                                    },
                                    title: Text(
                                      widget.collectionTitle[index],
                                      style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    leading: Icon(Icons.image))),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  widget.collectionUrl[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
