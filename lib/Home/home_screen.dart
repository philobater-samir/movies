import 'package:flutter/material.dart';
import 'package:movie_app/Home/coming_HomeUi.dart';
import 'package:movie_app/Home/popular_HomeUi.dart';
import 'package:movie_app/Home/top_HomeUi.dart';

class homeScreen extends StatelessWidget {
static const String routeName = 'homeScreen' ;
popularUi ui = popularUi();
comingUi comeui = comingUi();
topHomeUi topUi = topHomeUi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child:Container(
                margin: EdgeInsets.only(top: 50),
                child: ui,
                ),
              )
            ,
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Releases ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),textAlign: TextAlign.start,),
                    SizedBox(height: 2,),
                    Container(
                      child: comeui,
                    )

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recomended',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),textAlign: TextAlign.start,),
                    SizedBox(height: 2,),
                    Container(
                      child: topUi,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ] ),


    );
  }
}
