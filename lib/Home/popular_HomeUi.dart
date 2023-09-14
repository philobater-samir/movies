import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/Home/popular_widget.dart';
import 'package:movie_app/model/MoviesResponse.dart';

class popularUi extends StatelessWidget {
  static const String routeName = 'popularUi';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
        future: Api.getPopular(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search_icon.png',width: 100,),
                  Text('Please Wait',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800),)
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search_icon.png',width: 100,),
                  Text('We have error',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800),)
                ],
              ),
            );
          }
          var movieList = snapshot.data?.results ?? [];

          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return popularWidget(movies: movieList[index]);
              },);
        });
  }
}
