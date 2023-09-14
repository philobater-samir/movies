import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Category/category_item_show.dart';
import 'package:movie_app/model/category.dart';

class categoryWidget extends StatelessWidget {
  late Category? category ;
  categoryWidget({ this.category});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height ;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(categoryItemShow.routeName);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height* 2,
              width: width*2,
              child: Opacity(
                  opacity:.3 ,
                  child: Image.asset('${category?.image}',width: double.infinity,height: double.infinity,fit: BoxFit.fill,))),
          Blur(
            borderRadius: BorderRadius.circular(8),
            blur: .3,
            blurColor: Colors.grey.withOpacity(.3),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                category?.title ?? "" ,
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
