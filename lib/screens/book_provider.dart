import 'package:flutter/material.dart';

class Book {
  final String title;
  final String summary;

  Book({
    required this.title,
    required this.summary,
  });
}

class BookProvider extends ChangeNotifier {
  List<Book> _readlist = [];
  List<Book> _continueReading = [];
  List<Book> _recentlyRead = [];
  List<Book> _myBooks = []; // Added My Books list

  List<Book> get readlist => _readlist;
  List<Book> get continueReading => _continueReading;
  List<Book> get recentlyRead => _recentlyRead;
  List<Book> get myBooks => _myBooks; // Getter for My Books

  int get numberOfBooksToRead => _readlist.length;
  int get numberOfBooksRead => _recentlyRead.length;

  // Add a book to the Readlist
  void addToReadlist(Book book) {
    _readlist.add(book);
    notifyListeners();
  }

  // Add a book to My Books and remove from Recently Read
  void addToMyBooks(Book book) {
    _myBooks.add(book);
    removeFromRecentlyRead(
        book); // Ensure it's removed from Recently Read list if present
    notifyListeners();
  }

  // Start reading a book: Move from Readlist to Continue Reading
  void startReading(Book book) {
    _readlist.remove(book);
    _continueReading.add(book);
    notifyListeners();
  }

  // Complete reading a book: Move from Continue Reading to Recently Read
  void completeReading(Book book) {
    _continueReading.remove(book);
    _recentlyRead.add(book);
    notifyListeners();
  }

  // Delete a book from Readlist
  void deleteFromReadlist(Book book) {
    _readlist.remove(book);
    notifyListeners();
  }

  // Delete a book from Continue Reading
  void deleteFromContinueReading(Book book) {
    _continueReading.remove(book);
    notifyListeners();
  }

  // Remove a book from Recently Read
  void removeFromRecentlyRead(Book book) {
    _recentlyRead.remove(book);
    notifyListeners();
  }
}
