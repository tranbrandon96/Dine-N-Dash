import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';
import 'package:image_picker/image_picker.dart';

class Proxy extends StatefulWidget {
  @override
  _ProxyState createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xfffd1040),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
                                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
            },
          ),
          title: Text(
            'Proxy',
            style: TextStyle(

              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Container(
            child: Column(
                
                children: <Widget>[
              FlatButton(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Manager',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () {},
              ),
              Divider(color: Colors.black),
              FlatButton(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Waiter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () {},
              ),
              Divider(color: Colors.black),
              FlatButton(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Bartender',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () {},
              ),
              Divider(color: Colors.black),
            ])));
  }
}
