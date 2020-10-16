import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class FoodCategoryScreen extends StatefulWidget{
  _FoodCategoryScreen createState() => _FoodCategoryScreen();
}

class _FoodCategoryScreen extends State<FoodCategoryScreen>{
  List<ListTile> sameCategoryFoodItems = [
    ListTile(
      leading: SvgPicture.asset(
        "assets/images/foodPlaceHolder.svg",
        height: 35,
        width: 35,
      ),
      title: Text('Food Item Name'),
      subtitle: Text('XX - X Cal'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Text(
              "\$00.00",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Icon(Icons.keyboard_arrow_right),
        ]
      )
    )
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
        backgroundColor: Colors.white,
        title: Text(
          'Category',
          style: TextStyle(
            fontSize: 28.0,
            fontFamily: 'Futura',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: sameCategoryFoodItems),
      ),
    );
  }}