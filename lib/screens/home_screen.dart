import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'genres_tab_content.dart';
import 'recently_read_tab_content.dart';
import 'continue_reading_tab_content.dart';
import 'readlist_tab_content.dart';
// ignore: unused_import
import 'my_books_page.dart';
// ignore: unused_import
import 'profile_page.dart';
import 'home_tab_content.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;
  final double fontSize;
  final ValueChanged<double> onChangeFontSize;

  HomeScreen({
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
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
          tabs: [
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
                prefixIcon: Icon(Icons.search),
              ),
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
    );
  }
}
