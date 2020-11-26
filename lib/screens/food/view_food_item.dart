import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewFoodItemScreen extends StatefulWidget {
  String itemName;
  String menuName;
  String tableNumber;
  ViewFoodItemScreen(String tableNumber, String itemName, String menuType){
    this.itemName = itemName;
    menuName = menuType;
    this.tableNumber = tableNumber;

  }
  @override
  _ViewFoodItemScreenState createState() => _ViewFoodItemScreenState(tableNumber,itemName,menuName);
}

class _ViewFoodItemScreenState extends State<ViewFoodItemScreen> {
  String tableNumber;
  String restaurantID = 'mVIkdMLJkvTkwaRvxqsPFgteNkv1';
  String menuName;
  String calories="";
  String description="";
  String itemName="";
  String key ="";
  String imageURL="";
  Map<dynamic, dynamic>modifications = {};
  double price;

  int quantity = 0;
  String specialInstructions="";
  String allergy="";

  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Menus");
  DatabaseReference tableRef = FirebaseDatabase.instance.reference().child("Tables");
  final FirebaseStorage mStorage = FirebaseStorage.instance;
  StorageReference defaultImageURL;

  _ViewFoodItemScreenState(String tableNumber, String itemName,String menuType){
    this.tableNumber = tableNumber;
    this.itemName = itemName;
    menuName = menuType;

    tableRef = tableRef.child("Table"+tableNumber).child("Items");
    dbRef = dbRef.child(restaurantID).child(menuName).child("Items").child(this.itemName);
    getData();
  }

  getData() async{
    await dbRef.once().then((snapshot) {
      Map<dynamic, dynamic> values= snapshot.value;
      calories = values["Calories"].toString();
      description = values["Description"].toString();
      this.itemName = values["Item_Name"].toString();
      price = values["Price"];
      modifications = values["Modifications"];
      if(values["Image"] != null){imageURL = values["Image"];}
      defaultImageURL = FirebaseStorage.instance.ref().child("Item_Images").child(restaurantID).child(imageURL);
      setState((){ });
    }
    );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFFFF0041), size:35,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        
//          title: Text('Change Password', style: TextStyle(color: Colors.black, fontSize: 36)),
        backgroundColor: Colors.white,
        
      ),
      body: Container(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 60),
                FutureBuilder(
                    future: defaultImageURL.getDownloadURL(),
                    builder:(context,snapshot){
                        if(snapshot.hasData) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return FadeInImage.assetNetwork(
                              placeholder: "",
                              image: snapshot.data.toString(),
                              width: 400,
                              height:300,
                            );
                            return Image.network(snapshot.data.toString(),width: 350,height: 250);
                          }
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          }
                        }
                      return SvgPicture.asset(
                          "assets/images/foodPlaceHolder.svg",
                          width: 250,
                          height: 150,
                          color: Color(0xFFFE0C40)
                      );
                    }
                ),
                SizedBox(height: 10),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,10,10,0),
                            child: Text(
                              itemName,
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,20,10),
                            child: Text(
                              "\$" + price.toString(),
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          )
                      ),
                    ]
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,40,10),
                            child: Text(
                              description,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          )
                      ),
                    ]
                ),
                Divider(
                    color: Colors.black,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              'Quantity',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                          child: FlatButton(
                            onPressed: () {
                              if(quantity > 0){quantity--;
                              setState(() {});
                              }
                            },
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      new Flexible(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                onPressed: () {
                                  quantity++;
                                  setState(() {});
                                },
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 24, color: Colors.black),
                                ),
                              )
                          )
                      )
                    ]
                ),
                Divider(
                    color: Colors.black,
                ),

                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Text(
                              "Modifications",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          )
                      )
                    ]
                ),
                modificationsBuilder(),
                Divider(
                    color: Colors.black,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,10,10,0),
                            child: Text(
                              'Special Instructions',
                              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                    ]
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,40,10),
                            child: Text(
                              'Animal Style',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          )
                      ),
                    ]
                ),
                Divider(
                    color: Colors.black,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: new Text(
                              'Allergy',
                              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          )
                      )
                    ]
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,40,10),
                            child: Text(
                              'None',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          )
                      ),
                    ]
                ),
                                Divider(
                    color: Colors.black,
                ),
                new             Container(
              padding: EdgeInsets.all(50.0),
              child: Center(
                child: new Builder(
    builder: (BuildContext context) {return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    if(quantity > 0) {
                      Map<String, Object> updateDoc = {};
                      updateDoc['Item_Name'] = itemName;
                      updateDoc['Price'] = price*quantity;
                      updateDoc['Modifications'] = modifications;
                      updateDoc['Quantity'] = quantity;
                      updateDoc['Status'] = 'Not Submitted';
                      DatabaseReference itemRef = tableRef.push();
                      key = itemRef.key;
                      updateDoc['Key'] = key;
                      itemRef.update(updateDoc);
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        content: new Text("Item Added"),
                      ));
                    }
                    else{
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        content: new Text("Please Select Quantity"),
                      ));
                    }
                  },
                  child: Text('ADD'),
                  color: const Color(0xfffd1040),
                  textColor: Colors.white,
                );}),
              ),
            ),
              ]
          )
      ),
    );
  }

  Widget modificationsBuilder(){

    if(modifications != null) {
      List lists = [];
      modifications.forEach((key, values) {
        lists.add(key);
      });
      return new ListView.builder(
          shrinkWrap: true,
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int index) {
            bool checkBoxValue = false;
            return new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
                        child: Text(
                          lists[index],
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      )
                  ),
                  new Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Checkbox(
                          value: modifications[lists[index]],
                          onChanged: (value) {

                            setState(() {
                              modifications[lists[index]] = value;
                            });
                          },
                        ),
                      )
                  )
                ]
            );
          }
      );
    }
    else {
      return new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,5,40,10),
                  child: Text(
                    'None',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )
            ),
          ]
      );
    }
  }

}