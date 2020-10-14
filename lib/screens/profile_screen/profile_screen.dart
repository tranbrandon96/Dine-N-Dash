import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              FlatButton(
                child: SizedBox(
                       width: double.infinity,
                       child: Text(
                          ' Hi John!',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                      ),
                    ),
                onPressed: () {},
              ),
              Divider(),
              FlatButton(
                child: SizedBox(
                       width: double.infinity,
                       child: Text(
                          ' Account Info',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                      ),
                    ),
                onPressed: () {},
              ),
              Divider(),
              FlatButton(
                child: SizedBox(
                       width: double.infinity,
                       child: Text(
                          ' Payment Method',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                      ),
                    ),
                onPressed: () {},
              ),
              Divider(),
              FlatButton(
                child: SizedBox(
                       width: double.infinity,
                       child: Text(
                          ' Settings',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                      ),
                    ),
                onPressed: () {},
              ),
            ]
          )
        
      )
    );
  }
}