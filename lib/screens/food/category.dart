import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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
  String restaurantID = "mVIkdMLJkvTkwaRvxqsPFgteNkv1";
  String menuName;
  List<dynamic>lists = [];
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Menus");

  _CategoryScreenState(){
    dbRef = dbRef.child(restaurantID);
  }

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
        child: categoryListView(),
      ),
    );
  }
  /// This method takes database data into a list. Returns and builds a listView with
  /// listTiles that have database data.
  Widget categoryListView() {
    return FutureBuilder(
      future: dbRef.once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        if (snapshot.hasData) {
          lists.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          values.forEach((key, values) {
            lists.add(values);
          });
          return new ListView.builder(
              shrinkWrap: true,
              itemCount: lists.length,
              itemBuilder: (BuildContext context, int index) {
                return  ListTile(

                  onTap: () {
                    menuName = lists[index]["Menu_Name"].toString();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodCategoryScreen(menuName)));},

                  title: Align(
                    child: Text("" + lists[index]["Menu_Name"].toString()),
                    alignment: Alignment(0.2, 0),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, size:35, color: Colors.black),
                );
              });
        }
        return CircularProgressIndicator();
      });}
}