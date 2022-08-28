import 'package:flutter/material.dart';

import '../search_details/search_details.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Pixabay"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Image.asset('assets/pixabay.jpeg'),
          TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "For example Dogs, Cats & Bananas",
                labelText: "Enter a category",
                contentPadding:
                    const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 25.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchDetails(
                        searchController.text
                    ),
                ),
              );
            },
            height: 60.0,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Text(
              "Search",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
