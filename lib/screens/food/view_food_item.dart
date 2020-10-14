import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class view_food_item extends StatefulWidget {
  @override
  _view_food_itemState createState() => _view_food_itemState();
}

class _view_food_itemState extends State<view_food_item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
//          title: Text('Change Password', style: TextStyle(color: Colors.black, fontSize: 36)),
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 60),
                      SvgPicture.asset(
                        "assets/foodPlaceHolder.svg",
                        width: 250,
                        height: 200,
                      ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,10,10,0),
                            child: Text(
                              'Entree Name',
                              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,20,10),
                            child: Text(
                              'Price',
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
                              'Brief Description of the food. Feel free to mention ingredients, food process, anything you want. Please eat the food.',
                              style: TextStyle(fontSize: 16, color: Colors.black),
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
                            padding: const EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              'Quantity',
                              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                      new Flexible(
                          child: FlatButton(
                            onPressed: () {
                              /*...*/
                            },
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      new Flexible(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                onPressed: () {
                                  /*...*/
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
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Text(
                              "Modifications",
                              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          )
                      )
                    ]
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
                            child: Text(
                              "Shrimp",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                shape: CircleBorder(
                                    side: BorderSide(color: Colors.grey)),
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                onPressed: () {},
                              )
                          )
                      )
                    ]
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
                            child: Text(
                              "No Shrimp",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                shape: CircleBorder(
                                    side: BorderSide(color: Colors.grey)
                                ),
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                onPressed: () {},
                              )
                          )
                      )
                    ]
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
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: new TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10,0,0,0)
                                )
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
              ]
          )
      ),
    );
  }
}