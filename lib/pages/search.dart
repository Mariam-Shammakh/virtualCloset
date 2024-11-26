import 'package:flutter/material.dart';

import '../model/item.dart';
import '../shared/colors.dart';
import 'details_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = ""; // User search input
  List<Item> searchResults = []; // Filtered results

  void searchItems(String query) {
    setState(() {
      searchResults = items
          .where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()) || // Search by name
              item.Category.toLowerCase().contains(query.toLowerCase())) // Search by category
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            query = value;
            searchItems(query);
          },
          autofocus: true,
          style:const TextStyle(color: Colors.white),
          decoration:const InputDecoration(
            hintText: 'Search by name or category',
            hintStyle: TextStyle(color: Colors.white60),
            border: InputBorder.none,
          ),
        ),
        backgroundColor:appbarGreen,
      ),
      body: Column(
        children: [
          
          Expanded(
            child: searchResults.isEmpty
                ? Center(
                    child: Text(
                      query.isEmpty
                          ? "Start typing to search..."
                          : "No results found!",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final item = searchResults[index];
                      return ListTile(
                        leading: Image.asset(
                          item.imgPath,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(item.name),
                        subtitle: Text(item.Category),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(product: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
