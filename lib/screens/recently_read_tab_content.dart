// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';
import 'search_provider.dart';

class RecentlyReadTabContent extends StatelessWidget {
  final double height;

  const RecentlyReadTabContent({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final bookProvider = Provider.of<BookProvider>(context);
    final query = searchProvider.query;

    // Filter books based on the search query
    final books = bookProvider.recentlyRead
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];

            return ListTile(
              title: Text(
                book.title,
                style: TextStyle(fontSize: 28),
              ),
              subtitle: Text(
                book.summary,
                style: TextStyle(fontSize: 20),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bookProvider.addToMyBooks(book);
                      bookProvider.removeFromRecentlyRead(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${book.title} moved to My Books')),
                      );
                    },
                    child: Text('Add to My Books'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bookProvider.removeFromRecentlyRead(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${book.title} removed from Recently Read')),
                      );
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
