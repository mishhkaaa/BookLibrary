import 'package:flutter/material.dart';

class Book {
  final String title;
  final String imageUrl;
  final String summary;

  Book({
    required this.title,
    required this.imageUrl,
    required this.summary,
  });
}

class BookProvider extends ChangeNotifier {
  List<Book> _readlist = [];
  List<Book> _continueReading = [];
  List<Book> _recentlyRead = [];

  List<Book> get readlist => _readlist;
  List<Book> get continueReading => _continueReading;
  List<Book> get recentlyRead => _recentlyRead;

  void addToReadlist(Book book) {
    _readlist.add(book);
    notifyListeners();
  }

  void addToMyBooks(Book book) {
    // Implementation for adding to MyBooks
  }

  void startReading(Book book) {
    _readlist.remove(book);
    _continueReading.add(book);
    notifyListeners();
  }

  void completeReading(Book book) {
    _continueReading.remove(book);
    _recentlyRead.add(book);
    notifyListeners();
  }

  void deleteFromReadlist(Book book) {
    _readlist.remove(book);
    notifyListeners();
  }

  void deleteFromContinueReading(Book book) {
    _continueReading.remove(book);
    notifyListeners();
  }

  void deleteFromRecentlyRead(Book book) {
    _recentlyRead.remove(book);
    notifyListeners();
  }

  void removeFromReadlist(Book book) {}

  void removeFromContinueReading(Book book) {}
}
