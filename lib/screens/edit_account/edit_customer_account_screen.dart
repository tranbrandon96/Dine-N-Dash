import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditCustomerAccount extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
          title: Text('Account Info', style: TextStyle(color: Colors.black, fontSize: 36)),
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 30),
                      SvgPicture.asset(
                        "assets/icons/user-5.svg",
                        width: 110,
                        height: 110,
                      ),
                      Text(
                        'Change Profile Picture',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'First Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: false,
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
                        'Last Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: false,
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
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: false,
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
                        'Phone',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Container(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.left,
                            obscureText: false,
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
                    ]
                )
            )
        )
    );
  }
}