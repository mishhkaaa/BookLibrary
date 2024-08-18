// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String _query = ''; // Store the current search query

  List<String> _allBooks = [
    'Book 1',
    'Book 2',
    'Book 3',
    // Add more book titles or data
  ];

  // Getter for query
  String get query => _query;

  // Setter for query and notify listeners
  void setQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  // Filter books based on the given query
  List<String> suggestions(String query) {
    if (query.isEmpty) {
      return [];
    }
    return _allBooks
        .where((book) => book.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Search function, which uses the same logic as suggestions
  List<String> search(String query) {
    return suggestions(query);
  }
}
