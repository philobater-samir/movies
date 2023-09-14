import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/Home/coming_HomeUi.dart';
import 'package:movie_app/model/MoviesResponse.dart';
class movieDetails extends StatelessWidget {
  static const String routeName = 'movieDetails';

  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)?.settings.arguments as Movies;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          movie.title ?? "",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Expanded(child: Image.network('${Api.imageBseUrl}${movie.backdropPath}')),
                  Row(
                    children: [
                      Expanded(
                          flex: 1, child: Container(
                        height:height*.25 ,
                          width: width*.2,
                          child: Image.network('${Api.imageBseUrl}${movie.posterPath}'))),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text(movie.overview ?? "",style: TextStyle(color: Colors.white),),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${movie.voteAverage}',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('More Like This',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    comingUi(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
