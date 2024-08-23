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
    final bookProvider = Provider.of<BookProvider>(context);
    final query = searchProvider.query;

    // Filter the books in the readlist based on the search query.
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
              title: GestureDetector(
                onTap: () {
                  // Navigate to the details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailsPage(book: book),
                    ),
                  );
                },
                child: Text(
                  book.title,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bookProvider.startReading(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${book.title} moved to Continue Reading'),
                        ),
                      );
                    },
                    child: Text(
                      'Start Reading',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      bookProvider.deleteFromReadlist(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${book.title} removed from Readlist'),
                        ),
                      );
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(fontSize: 14),
                    ),
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

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              book.summary,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
