import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/model/MoviesResponse.dart';
import 'package:movie_app/model/category.dart';
import 'package:movie_app/movieWidget.dart';

class categoryItemShow extends StatelessWidget {
  static const String routeName = 'categoryShow' ;
  late Category? category;
  categoryItemShow({ this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder<MoviesResponse>(
            future: Api.getCategory(category?.id?? ''),
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
                      color: Colors.grey[500],
                      height: 3,
                      thickness: 5,
                    );
                  },
                  itemCount: movieList.length);
            }),
      ),
    ) ;
  }
}
