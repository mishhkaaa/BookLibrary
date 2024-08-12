import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_drawer.dart';
import 'genres_tab_content.dart';
import 'recently_read_tab_content.dart';
import 'continue_reading_tab_content.dart';
import 'readlist_tab_content.dart';
import 'home_tab_content.dart';
import 'search_provider.dart'; // Ensure this import path is correct
import 'book_search_delegate.dart'; // Ensure this import path is correct
import 'book_provider.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;
  final double fontSize;
  final ValueChanged<double> onChangeFontSize;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode,
    required this.fontSize,
    required this.onChangeFontSize,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Library Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BookSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage('https://placeimg.com/80/80/people'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('10'),
                              Text('Books Read'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('20'),
                              Text('Books to Read'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: 'Home'),
            Tab(text: 'Genres'),
            Tab(text: 'Recently Read'),
            Tab(text: 'Continue Reading'),
            Tab(text: 'Readlist'),
          ],
        ),
      ),
      drawer: AppDrawer(
        isDarkMode: widget.isDarkMode,
        onToggleDarkMode: widget.onToggleDarkMode,
        fontSize: widget.fontSize,
        onChangeFontSize: widget.onChangeFontSize,
        tabController: _tabController,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for books...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                searchProvider.setQuery(query);
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeTabContent(),
                GenresTabContent(),
                RecentlyReadTabContent(),
                ContinueReadingTabContent(),
                ReadlistTabContent(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _showAddBookDialog(context), // Trigger the Add Book dialog
        child: const Icon(Icons.add),
        tooltip: 'Add a new book',
      ),
    );
  }

  void _showAddBookDialog(BuildContext context) {
    final bookTitleController = TextEditingController();
    final bookSummaryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bookTitleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: bookSummaryController,
                decoration: const InputDecoration(labelText: 'Summary'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addBookToReadlist(
                  context,
                  bookTitleController.text,
                  bookSummaryController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addBookToReadlist(BuildContext context, String title, String summary) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);

    bookProvider.addToReadlist(
      Book(
        title: title,
        imageUrl:
            'https://placeimg.com/640/480/any', // Example placeholder image
        summary: summary,
      ),
    );
  }
}
