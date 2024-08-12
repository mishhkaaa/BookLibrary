import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_provider.dart';
import 'book_provider.dart';

class ContinueReadingTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final bookProvider = Provider.of<BookProvider>(context);
    final query = searchProvider.query; // Use the query from SearchProvider

    // Filter books based on the search query
    final books = bookProvider.continueReading
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
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  bookProvider.completeReading(book);
                },
                child: Text('Complete Reading'),
              ),
              ElevatedButton(
                onPressed: () {
                  bookProvider.removeFromContinueReading(book);
                },
                child: Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }
}
