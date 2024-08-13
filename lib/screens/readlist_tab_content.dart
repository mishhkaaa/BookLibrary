import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';
import 'search_provider.dart';

class ReadlistTabContent extends StatelessWidget {
  final double height;

  const ReadlistTabContent({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    final query = searchProvider.query;

    final books = bookProvider.readlist
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
                      bookProvider.startReading(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${book.title} moved to Continue Reading')),
                      );
                    },
                    child: Text('Start Reading'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bookProvider.deleteFromReadlist(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${book.title} removed from Readlist')),
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
