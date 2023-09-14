import 'package:flutter/material.dart';
import 'package:movie_app/Category/category_item_show.dart';
import 'package:movie_app/Home/home_screen.dart';
import 'package:movie_app/Category/category_screen.dart';
import 'package:movie_app/basic.dart';
import 'package:movie_app/Search_dir/search_screen.dart';
import 'package:movie_app/movie_Details.dart';

void main(){
  runApp(movieApp());
}
class movieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        basicScreen.routeName : (context)=> basicScreen(),
        searchScreen.routeName : (context)=> searchScreen(),
        categoryScreen.routeName : (context)=> categoryScreen(),
        homeScreen.routeName : (context) => homeScreen(),
        movieDetails.routeName:(context)=>movieDetails(),
        categoryItemShow.routeName :(context) => categoryItemShow()
      },
      initialRoute: basicScreen.routeName,

    );
  }
}
