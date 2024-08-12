import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';
import 'search_provider.dart'; // Ensure this import path is correct

class RecentlyReadTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final bookProvider = Provider.of<BookProvider>(context);
    final query = searchProvider.query;

    // Filter books based on the search query
    final books = bookProvider.recentlyRead
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          leading: Image.network(book.imageUrl, width: 50),
          title: Text(book.title),
          subtitle: Text(book.summary),
        );
      },
    );
  }
}
