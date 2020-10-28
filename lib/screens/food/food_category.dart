import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/food/view_food_item.dart';
import 'package:flutter_svg/svg.dart';

class FoodCategoryScreen extends StatefulWidget{
  _FoodCategoryScreen createState() => _FoodCategoryScreen();
}

class _FoodCategoryScreen extends State<FoodCategoryScreen>{
  List<ListTile> sameCategoryFoodItems = [

  ];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFFFF0041), size:35,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        backgroundColor: Colors.white,
        title: Text(
          
          'Category',
          style: TextStyle(
            fontFamily: 'Futura',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
                ListTile(
                                onTap: () {
             Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => ViewFoodItemScreen()));
        },
      leading: SvgPicture.asset(
        "assets/images/foodPlaceHolder.svg",
        height: 35,
        width: 35,
        color: Color(0xFFFF0041)
      ),
      title: Text('Double Double'),
      subtitle: Text('670 Cal'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Text(
              "\$3.45",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Icon(Icons.keyboard_arrow_right),
        ]
      )
    )
          ],),
      ),
    );
  }}