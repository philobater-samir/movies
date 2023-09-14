import 'package:flutter/material.dart';
import 'package:movie_app/Api.dart';
import 'package:movie_app/model/MoviesResponse.dart';
import 'package:movie_app/movie_Details.dart';

class movieWidget extends StatelessWidget {
Movies movies ;
movieWidget ({required this.movies}) ;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(movieDetails.routeName,arguments: movies);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height*.15,
              width: width*.2,
              child: Image.network('${Api.imageBseUrl}${movies.posterPath}'),
            ),
            SizedBox(width:20 ,),
            SizedBox(
              width: width*.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${movies.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.start,),
                  SizedBox(height: 15,),
                  Text('${movies.overview}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),textAlign: TextAlign.start,),
                  SizedBox(height: 15,),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                        )
                      ],
                    ),

                    Text('${movies.releaseDate}',style: TextStyle(color: Colors.grey[600]),),

                  ],)


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
