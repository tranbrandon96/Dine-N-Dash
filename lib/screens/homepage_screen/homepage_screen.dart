import 'package:flutter/material.dart';
import 'package:flutter_app/components/main_drawer.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dine N Dash", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black)
      ),

    
      drawer: Drawer(
        child: MainDrawer(),
      ),

      
      
    );
  }
}
