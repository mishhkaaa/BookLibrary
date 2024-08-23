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
                      bookProvider.addToMyBooks(book);
                      bookProvider.removeFromRecentlyRead(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${book.title} moved to My Books'),
                        ),
                      );
                    },
                    child: Text('Add to My Books'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      bookProvider.removeFromRecentlyRead(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${book.title} removed from Recently Read'),
                        ),
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
