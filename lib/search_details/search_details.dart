import 'package:flutter/material.dart';
import 'package:flutter_gallery_app_search/network/api_client.dart';


class SearchDetails extends StatefulWidget {
  final String searchText;
  const SearchDetails(this.searchText, {super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SearchDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text("Search Results"),
            ),
            body: FutureBuilder(
                future: getPics(widget.searchText),
                builder: (context, snapshot) {
                  final Map? data = snapshot.data;
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text(
                          "Error",
                          style: TextStyle(fontSize: 16.0, color: Colors.red),
                        ));
                  } else if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: (data!["hits"] as List).length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                          ),
                          itemBuilder: (context, index) {
                            return Image.network(
                              data['hits'][index]['largeImageURL'],
                              fit: BoxFit.cover,
                            );
                          }),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(color: Colors.green,));
                  }
                }),
          );
  }
}
