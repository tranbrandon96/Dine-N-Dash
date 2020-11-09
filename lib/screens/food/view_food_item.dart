import 'package:flutter/material.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewFoodItemScreen extends StatefulWidget {
  @override
  _ViewFoodItemScreenState createState() => _ViewFoodItemScreenState();
}

class _ViewFoodItemScreenState extends State<ViewFoodItemScreen> {
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
                      SvgPicture.asset(
                        "assets/images/foodPlaceHolder.svg",
                        width: 250,
                        height: 150,
                        color: Color(0xFFFE0C40)
                      ),
                SizedBox(height: 10),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,10,10,0),
                            child: Text(
                              'Double Double',
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          )
                      ),
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,20,10),
                            child: Text(
                              '3.49',
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
                              'Toasted Buns, Two Cheese, Two Beef Patties, Lettuce, Onions, Tomatos, Spread ',
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
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
                            child: Text(
                              "No Pickles",
                              style: TextStyle(fontSize: 16, color: Colors.black),
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
                                highlightColor: Color(0xFFFE0C40),
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
                              "No Lettuce",
                              style: TextStyle(fontSize: 16, color: Colors.black),
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
                                highlightColor: Color(0xFFFE0C40),
                                onPressed: () {},
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
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    //TO-DO: Needs to be fixed
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ViewTableScreen("12")));
                  },
                  child: Text('ADD'),
                  color: const Color(0xfffd1040),
                  textColor: Colors.white,
                ),
              ),
            ),
              ]
          )
      ),
    );
  }
}