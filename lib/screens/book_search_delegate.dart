import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_provider.dart';

class BookSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the search bar, e.g., a button to clear the query
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
          showSuggestions(context); // Show the suggestions
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Widget to display before the search query
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search and return an empty string
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    // Use the searchProvider to get search results
    final results = searchProvider.search(query);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final book = results[index];
        return ListTile(
          title: Text(book),
          onTap: () {
            // Handle book selection
            close(
                context, book); // Close the search and return the selected book
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    // Use the searchProvider to get suggestions
    final suggestions = searchProvider.suggestions(query);

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final book = suggestions[index];
        return ListTile(
          title: Text(book),
          onTap: () {
            // Handle suggestion selection
            query = book; // Update the query with the selected suggestion
            showResults(context); // Show the search results
          },
        );
      },
    );
  }
}
