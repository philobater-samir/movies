import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/Home/coming_widget.dart';
import 'package:movie_app/Home/similar_widget.dart';
import 'package:movie_app/model/MoviesResponse.dart';

class Similar extends StatelessWidget {
  static const String routeName = 'popularUi';
  Movies? movies ;
  Similar({this.movies});
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
        future: Api.getSimilar(id:movies?.id??""),
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
          var movieList = snapshot.data?.results?? [];
          print(movieList);
          return Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return similarWidget(movies: movieList[index]);
                },),
          );
        });
  }
}
