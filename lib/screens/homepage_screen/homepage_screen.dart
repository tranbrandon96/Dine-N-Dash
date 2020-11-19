import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/employee_main_drawer.dart';
import 'package:flutter_app/screens/employee_screens/table_info_screen.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_database/firebase_database.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  String userID;

  final fbReference = FirebaseDatabase.instance.reference();
  Query dbRef;
  List<dynamic>lists = [];

  _HomePageState(){
    user = auth.currentUser;
    userID = user.uid;
    dbRef = FirebaseDatabase.instance.reference().child("Tables").orderByChild("employee_ID").equalTo(userID);
}

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
          IconButton(icon: Icon(Icons.credit_card), onPressed: () {},)
        ],
          
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {displayModalBottomSheet(context);
                                                   
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFFFF0041)
      ),

      drawer: Drawer(
        child: MainDrawer(),
      ),
      
      body: Container(child: tableListView(),),
    );
  }

  /// This method takes database data into a list. Returns and builds a listView with
     /// listTiles that have database data.
     Widget tableListView() {return FutureBuilder(
         future: dbRef.once(),
         builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
           if (snapshot.hasData) {
             lists.clear();
             Map<dynamic, dynamic> values = snapshot.data.value;
             if(values != null) {
               values.forEach((key, values) {
                 lists.add(values);
               });
               return new ListView.builder(
                   shrinkWrap: true,
                   itemCount: lists.length,
                   itemBuilder: (BuildContext context, int index) {
                     return ListTile(
                       onTap: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                     ViewTableScreen(
                                         lists[index]["Table_Number"]
                                             .toString())));
                       },
                       leading: SvgPicture.asset(
                         "assets/icons/user-1.svg",
                         height: 60,
                         width: 60,
                       ),
                       title: Text("" + lists[index]["User_Name"].toString()),
                       subtitle: Text(
                           'Check In: ' + lists[index]["Check_In"].toString() +
                               '\nParty Size ' +
                               lists[index]["Party_Size"].toString()),
                       trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             Text('Table ' +
                                 lists[index]["Table_Number"].toString(),
                               style: TextStyle(fontSize: 20, color: Colors
                                   .grey),),
                             Icon(Icons.keyboard_arrow_right),
                           ]),
                     );
                   });
             }
             else{
               return Center(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text("ADD A TABLE")]
                  )
                  );
             }
           }
           return CircularProgressIndicator();
         });}
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


