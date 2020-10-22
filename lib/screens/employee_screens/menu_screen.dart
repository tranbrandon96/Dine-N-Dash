import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class MenuScreen extends StatefulWidget{
  _MenuScreen createState() => _MenuScreen();
}

class _MenuScreen extends State<MenuScreen>{
  List<ListTile> menuList = [
    ListTile(
        title: Text('Food Category'),
        trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Icon(Icons.keyboard_arrow_right),
            ]
        )
    )
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
        backgroundColor: Colors.white,
        title: Container(
          width:MediaQuery.of(context).size.width/2,
           padding: EdgeInsets.all(10),
           decoration: BoxDecoration(color: Color(0xFFFF0041), borderRadius: BorderRadius.circular(50)),
           child:Align(
             alignment: Alignment.center,
             child:Text( "MENU",
               style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,),
        ),),
    ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: menuList),
      ),
    );
  }
}