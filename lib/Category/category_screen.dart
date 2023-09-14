import 'package:flutter/material.dart';
import 'package:movie_app/Category/categoryWidget.dart';
import 'package:movie_app/model/category.dart';

class categoryScreen extends StatelessWidget {
  static const String routeName = 'category' ;
  var categoryList = Category.getCategory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemBuilder: (context, index) {
              return categoryWidget(category: categoryList[index]);
            },
          itemCount: categoryList.length,
        ),
      ),

    );
  }
}
