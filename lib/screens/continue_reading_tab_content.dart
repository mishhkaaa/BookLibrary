import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class ContinueReadingTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return ListView.builder(
      itemCount: bookProvider.continueReading.length,
      itemBuilder: (context, index) {
        final book = bookProvider.continueReading[index];
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
