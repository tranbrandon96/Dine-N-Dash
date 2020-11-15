import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/food/view_food_item.dart';
import 'package:flutter_svg/svg.dart';

class FoodCategoryScreen extends StatefulWidget{
  String menuName;
  FoodCategoryScreen(String menuType){
    menuName = menuType;
  }
  _FoodCategoryScreen createState() => _FoodCategoryScreen(menuName);
}

class _FoodCategoryScreen extends State<FoodCategoryScreen>{
  String restaurantID = "mVIkdMLJkvTkwaRvxqsPFgteNkv1";
  String menuName;
  String itemName;
  List<dynamic>lists = [];
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Menus");

  _FoodCategoryScreen(String menuType){
    menuName = menuType;
    dbRef = dbRef.child(restaurantID).child(menuName).child("Items");
  }


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
          
          menuName,
          style: TextStyle(
            fontFamily: 'Futura',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: itemsListView(),
      ),
    );
  }

  Widget itemsListView() {
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
                        itemName = lists[index]["Item_Name"].toString();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewFoodItemScreen(itemName,menuName)));
                      },
                      leading: SvgPicture.asset(
                      "assets/images/foodPlaceHolder.svg",
                      height: 35,
                      width: 35,
                      color: Color(0xFFFF0041)
                  ),
                      title: Text(lists[index]["Item_Name"].toString()),
                      subtitle: Text(lists[index]["Calories"].toString()),
                      trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                      Text(
                        lists[index]["Price"].toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Icon(Icons.keyboard_arrow_right),
                      ]
                      )
                  );
                });
          }
          return CircularProgressIndicator();
        });}
}