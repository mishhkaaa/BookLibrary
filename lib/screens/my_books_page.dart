import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class MyBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final myBooks = bookProvider
        .myBooks; // Assuming that 'My Books' list is stored in '_readlist'

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Books',
          style: TextStyle(color: Colors.white, fontSize: 26),
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
                );
              },
            ),
    );
  }
}
