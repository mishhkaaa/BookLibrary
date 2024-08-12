import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String summary;

  Book({
    required this.title,
    required this.author,
    required this.summary,
  });
}

class ReadlistProvider extends ChangeNotifier {
  final List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }
}
