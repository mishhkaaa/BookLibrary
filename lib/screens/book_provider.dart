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
  List<Book> _readlist = [
    Book(
      title: 'Verity',
      summary:
          'In Verity, struggling writer Lowen Ashleigh is offered a lucrative opportunity to finish the remaining books in a successful author Verity Crawford\'s series after her tragic accident. Lowen moves into the Crawford home to review Verity\’s notes and research. While there, she discovers an unpublished autobiography by Verity that reveals disturbing and violent truths about Verity\’s life and her family. As Lowen delves deeper into the manuscript, she becomes entangled in a web of deception, danger, and psychological manipulation. The novel explores themes of truth, deception, and the moral ambiguity of its characters.',
    ),
    Book(
      title: 'The Silent Patient',
      summary:
          'In The Silent Patient, Alicia Berenson, a famous painter, is accused of murdering her husband and then stops speaking entirely, becoming mute. She is committed to a psychiatric institution and remains silent for years. Theo Faber, a forensic psychologist, becomes fascinated by Alicia\'s case and takes on the challenge of uncovering the truth behind her silence. As Theo investigates, he uncovers shocking secrets about Alicia, himself, and the circumstances of the murder, leading to a dramatic and unexpected twist. The novel delves into themes of obsession, trauma, and the complexity of human psychology.',
    ),
    Book(
      title: 'Never Lie',
      summary:
          'In Never Lie, Dr. Hannah Brown is a psychologist who is recovering from a traumatic experience and moves to a new town for a fresh start. She starts working with a patient, Sarah, who is suspected of a serious crime but insists on her innocence. As Hannah delves into Sarah\’s past, she begins to uncover a series of lies and deceptions that challenge her understanding of truth and morality. The novel is a psychological thriller that explores the impact of trauma, the intricacies of human behavior, and the quest for justice.',
    ),
  ];

  List<Book> _continueReading = [
    Book(
      title: "A Good Girl’s Guide to Murder",
      summary:
          "Pippa 'Pip' Fitz-Amobi investigates a five-year-old murder case for her senior project, uncovering secrets and facing challenges along the way.",
    ),
    Book(
      title: "The Cruel Prince",
      summary:
          "Jude Duarte, a mortal girl living in the High Court of Faerie, navigates the dangerous political intrigues and battles for power and acceptance.",
    ),
  ];

  List<Book> _recentlyRead = [
    Book(
      title: "It Ends with Us",
      summary:
          "Lily Bloom moves to Boston, meets Ryle Kincaid, and struggles with a relationship marked by love, abuse, and difficult choices, ultimately prioritizing her safety and breaking the cycle of abuse.",
    ),
    Book(
      title: "The Housemaid",
      summary:
          "Millie Calloway, a young woman with a criminal past, takes a job as a live-in housekeeper for Nina Winchester, uncovering dark secrets about the family while navigating a tense and dangerous environment.",
    ),
  ];

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

  // Remove a book from My Books
  void removeFromMyBooks(Book book) {
    _myBooks.remove(book);
    notifyListeners();
  }
}
