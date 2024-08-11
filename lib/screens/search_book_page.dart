import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class SearchBooksPage extends StatefulWidget {
  @override
  _SearchBooksPageState createState() => _SearchBooksPageState();
}

class _SearchBooksPageState extends State<SearchBooksPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> _searchResults = [];

  void _searchBooks(String query) {
    // Replace this with real API search logic
    // For now, we will use mock data
    List<Book> mockData = [
      Book(
        title: 'Book One',
        imageUrl: 'https://placeimg.com/640/480/any',
        summary: 'Summary of Book One',
      ),
      Book(
        title: 'Book Two',
        imageUrl: 'https://placeimg.com/640/480/any',
        summary: 'Summary of Book Two',
      ),
    ];

    setState(() {
      _searchResults = mockData
          .where(
              (book) => book.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Books'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for a book',
                border: OutlineInputBorder(),
              ),
              onChanged: _searchBooks,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final book = _searchResults[index];
                return ListTile(
                  leading: Image.network(book.imageUrl, width: 50),
                  title: Text(book.title),
                  subtitle: Text(book.summary),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          bookProvider.addToReadlist(book);
                        },
                        child: Text('Add to Readlist'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add logic to add to MyBooks
                        },
                        child: Text('Add to MyBooks'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
