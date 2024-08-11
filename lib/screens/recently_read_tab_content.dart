import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class RecentlyReadTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return ListView.builder(
      itemCount: bookProvider.recentlyRead.length,
      itemBuilder: (context, index) {
        final book = bookProvider.recentlyRead[index];
        return ListTile(
          leading: Image.network(book.imageUrl, width: 50),
          title: Text(book.title),
          subtitle: Text(book.summary),
        );
      },
    );
  }
}
