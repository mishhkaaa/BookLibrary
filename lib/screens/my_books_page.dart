import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class MyBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final myBooks = bookProvider.myBooks;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Books',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: myBooks.isEmpty
          ? Center(
              child: Text(
                'No books in My Books section.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: myBooks.length,
              itemBuilder: (context, index) {
                final book = myBooks[index];
                return ListTile(
                  title: Text(
                    book.title,
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    book.summary,
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      bookProvider.removeFromMyBooks(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${book.title} removed from My Books'),
                        ),
                      );
                    },
                    child: Text('Remove'),
                  ),
                );
              },
            ),
    );
  }
}
