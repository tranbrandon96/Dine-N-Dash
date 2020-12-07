import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/firebase/sign_in.dart';
import 'package:flutter_app/screens/food/view_food_item.dart';
import 'package:flutter_svg/svg.dart';

class FoodCategoryScreen extends StatefulWidget{
  String menuName;
  String tableNumber;
  FoodCategoryScreen(String tableNumber, String menuType){
    menuName = menuType;
    this.tableNumber = tableNumber;
  }
  _FoodCategoryScreen createState() => _FoodCategoryScreen(tableNumber, menuName);
}

class _FoodCategoryScreen extends State<FoodCategoryScreen>{
  String restaurantID = 'mVIkdMLJkvTkwaRvxqsPFgteNkv1';
  String menuName;
  String itemName;
  String tableNumber;
  String imageURL="";
  List<dynamic>lists = [];
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Menus");

  final FirebaseStorage mStorage = FirebaseStorage.instance;
  StorageReference defaultImageURL =  FirebaseStorage.instance.ref();

  _FoodCategoryScreen(String tableNumber,String menuType){
    this.tableNumber = tableNumber;
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

  Future<DataSnapshot>getData() async{return await dbRef.once();}

  Widget itemsListView() {
    return FutureBuilder(
        future: getData(),
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
                  if(lists[index]["Image"] != null){imageURL = lists[index]["Image"];}
                  defaultImageURL = FirebaseStorage.instance.ref().child("Item_Images").child(restaurantID).child(imageURL);
                  return  ListTile(
                      onTap: () {
                        itemName = lists[index]["Item_Name"].toString();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewFoodItemScreen(tableNumber,itemName,menuName)));
                      },
                      leading: FutureBuilder(
                          future: defaultImageURL.getDownloadURL(),
                          builder:(context,snapshot){
                            if(snapshot.hasData) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return FadeInImage.assetNetwork(
                                  placeholder: "",
                                  image: snapshot.data.toString(),
                                  width: 100,
                                  height:50,
                                );
                                return Image.network(snapshot.data.toString(),width: 350,height: 250);
                              }
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }
                            }
                            return SvgPicture.asset(
                                "assets/images/foodPlaceHolder.svg",
                                width: 35,
                                height: 35,
                                color: Color(0xFFFE0C40)
                            );
                          }
                      ),
                      title: Text(lists[index]["Item_Name"].toString()),
                      subtitle: Text(lists[index]["Calories"].toString()),
                      trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                      Text(
                        "\$"+ lists[index]["Price"].toString(),
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