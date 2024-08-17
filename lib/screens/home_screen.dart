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
  final double fontSize;
  final ValueChanged<double> onChangeFontSize;

  const HomeScreen({
    super.key,
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
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Librazy',
          style: TextStyle(
            fontSize: 28, // Set your desired font size here
            fontWeight: FontWeight.bold, // Optionally set font weight
            color: Colors.white, // Set text color to white
          ),
        ),
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
                builder: (context) {
                  return AlertDialog(
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
                                Text('${bookProvider.numberOfBooksRead}'),
                                Text('Books Read'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('${bookProvider.numberOfBooksToRead}'),
                                Text('Books to Read'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
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
        fontSize: widget.fontSize,
        onChangeFontSize: widget.onChangeFontSize,
        tabController: _tabController,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
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
                    HomeTabContent(height: constraints.maxHeight),
                    GenresTabContent(height: constraints.maxHeight),
                    RecentlyReadTabContent(height: constraints.maxHeight),
                    ContinueReadingTabContent(height: constraints.maxHeight),
                    ReadlistTabContent(height: constraints.maxHeight),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddBookDialog(context),
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
        summary: summary,
      ),
    );

    // Display a snackbar with a message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title has been added to the readlist'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
