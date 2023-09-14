import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/model/MoviesResponse.dart';
import 'package:movie_app/movie_Details.dart';

class popularWidget extends StatelessWidget {
  Movies movies;
  popularWidget({required this.movies});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(movieDetails.routeName, arguments: movies);
      },
      child: Expanded(
        child: SizedBox(
          width: width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: height * .25,
                  width: width * 1,
                  child: Image.network(
                    '${Api.imageBseUrl}${movies.backdropPath}',
                  )),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(movies.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    children: [
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
                            '${movies.voteAverage}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(movies.releaseDate ?? "",
                          style: TextStyle(color: Colors.grey[500]))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
