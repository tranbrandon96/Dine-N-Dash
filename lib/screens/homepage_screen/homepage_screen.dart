import 'package:flutter/material.dart';
import 'package:flutter_app/components/main_drawer.dart';
import 'package:flutter_app/screens/employee_screens/table_info_screen.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //   List<ListTile> tableItems = [
  //   ListTile(
  //     leading: SvgPicture.asset(
  //       "assets/icons/user-1.svg",
  //       height: 60,
  //       width: 60,
  //     ),
  //     title: Text('User Name'),
  //     subtitle: Text('Check In: 12:00pm\nParty Size 4'),
  //     trailing: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text('Table 14', style: TextStyle(fontSize: 20, color: Colors.grey),),
  //           IconButton(
  //             icon: Icon(Icons.keyboard_arrow_right),
  //           )
  //         ]),
      
  //   ),
  // ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width:MediaQuery.of(context).size.width/2,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Color(0xFFFF0041), borderRadius: BorderRadius.circular(50)),
          child:Align(
            alignment: Alignment.center,
            child:Text( "TABLES",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white,),
          ),),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.credit_card), onPressed: () {
                                       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewTableScreen()));
          },)
        ],
          
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {displayModalBottomSheet(context);
                                                   
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFFFF0041)
      ),

      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   child: ListView(children: tableItems),
      // ),
    
      drawer: Drawer(
        child: MainDrawer(),
        
      ),
      
      body: Column(children: [
        ListTile(
                leading: SvgPicture.asset(
        "assets/icons/user-1.svg",
        height: 60,
        width: 60,
      ),
      title: Text('John D'),
      subtitle: Text('Check In: 12:00pm\nParty Size 2'),
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Table 14', style: TextStyle(fontSize: 20, color: Colors.grey),),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewTableScreen()));
              }
            )
          ]),
        )
      ]
      )


      
    );

    
  }
}

 ///This class is the setup for calling a modal bottomSheet.
  void displayModalBottomSheet(context) {
    var bottomSheetController =
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        clipBehavior: Clip.hardEdge,
        isScrollControlled: true,

        context: context,
        builder: (BuildContext buildContext) {
          return SingleChildScrollView(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height:MediaQuery.of(context).size.height/3,
              color: Color(0xFF737373),
              child:TableInfoScreen(),
            ),
          );
        }
    );
  }


