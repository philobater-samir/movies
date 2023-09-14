import 'package:flutter/material.dart';
import 'package:movie_app/Home/home_screen.dart';
import 'package:movie_app/Category/category_screen.dart';
import 'package:movie_app/Search_dir/search_screen.dart';

class basicScreen extends StatefulWidget {
  static const String routeName = 'basicScreen';

  @override
  State<basicScreen> createState() => _basicScreenState();
}

class _basicScreenState extends State<basicScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    homeScreen(),
    searchScreen(),
    categoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconSize: 25,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onTapIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.black,
          ),

        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  void onTapIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
