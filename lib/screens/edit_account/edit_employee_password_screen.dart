import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditEmployeePassword extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
          title: Text('Change Password', style: TextStyle(color: Colors.black, fontSize: 36)),
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 60),

                      Text(
                        'Current Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: true,
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 15),
                      Text(
                        'New Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: true,
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Confirm New Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: true,
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 100),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFFFF0041))),
                        onPressed: () {},
                        color: Color(0xFFFF0041),
                        textColor: Colors.white,
                        child: Text('SAVE',
                            style: TextStyle(fontSize: 16)),
                      )
                    ]
                )
            )
        )
    );
  }
}