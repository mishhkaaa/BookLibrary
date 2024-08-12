import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_provider.dart'; // Ensure this import path is correct
import 'book_provider.dart'; // Ensure this import path is correct

class ReadlistTabContent extends StatelessWidget {
  final List<String> readList;

  const ReadlistTabContent({required this.readList});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    final query = searchProvider.query;

    // Filter books based on the search query
    final books = bookProvider.readlist
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          leading: book.imageUrl != null
              ? Image.network(book.imageUrl, width: 50)
              : null,
          title: Text(book.title),
          subtitle: Text(book.summary),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  bookProvider.startReading(book);
                },
                child: Text('Start Reading'),
              ),
              ElevatedButton(
                onPressed: () {
                  bookProvider.removeFromReadlist(book);
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
