import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/food/food_category.dart';
import 'package:flutter_svg/svg.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
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
          children: <Widget> [
            ListTile(
              onTap: () {
             Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => FoodCategoryScreen()));
        },
              title: Align(
                child: Text("ENTREES"),
                alignment: Alignment(0.2, 0),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, size:35, color: Colors.black)
            ),
          ] 
          ),
      ),
    );
  }}