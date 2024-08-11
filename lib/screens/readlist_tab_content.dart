import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class ReadlistTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return ListView.builder(
      itemCount: bookProvider.readlist.length,
      itemBuilder: (context, index) {
        final book = bookProvider.readlist[index];
        return ListTile(
          leading: Image.network(book.imageUrl, width: 50),
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
