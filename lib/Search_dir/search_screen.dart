import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/model/MoviesResponse.dart';
import 'package:movie_app/movieWidget.dart';

class searchScreen extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
   String searchText = '' ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: height * .1,
        backgroundColor: Colors.black,
        title: TextField(
          onChanged: (text){
            searchText = text ;
            setState(() {

            });
          },
          decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.white,
          ),
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          maxLines: 1,
          cursorColor: Colors.white,
        ),
      ),
      body: FutureBuilder<MoviesResponse>(
          future: Api.getSearch(searchKey: searchText),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/search_icon.png',
                      width: 100,
                    ),
                    Text(
                      'Please Wait',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/search_icon.png',
                      width: 100,
                    ),
                    Text(
                      'We have error',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              );
            }
            var movieList = snapshot.data?.results ?? [];
            return ListView.separated(
                itemBuilder: (context, index) {
                  return movieWidget(movies: movieList[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[600],
                    height: 3,
                    thickness: 5,
                  );
                },
                itemCount: movieList.length);
            ;
          }),
    );
  }
}
