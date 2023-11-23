import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "France",
    "Germany",
    "Austria",
    "Spain",
    "Venice",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var places in searchTerms) {
      if (places.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(places);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var places in searchTerms) {
      if (places.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(places);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
