import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/model/MoviesResponse.dart';
import 'package:movie_app/movie_Details.dart';

class similarWidget extends StatelessWidget {
  Movies movies ;
  similarWidget({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(movieDetails.routeName,arguments: movies);
        },

        child: Container(
          color: Colors.white,
          child: Image.network('${Api.imageBseUrl}${movies.posterPath}'),
        ),
      ),
    );
  }
}
