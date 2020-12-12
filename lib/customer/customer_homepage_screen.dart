import 'package:flutter/material.dart';
import 'package:flutter_app/components/customer_main_drawer.dart';
import 'package:flutter_app/components/membership_card_screen.dart';
import 'package:flutter_app/screens/employee_screens/table_info_screen.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerHomePageScreen extends StatefulWidget {
  @override
  _CustomerHomePageScreenState createState() => _CustomerHomePageScreenState();
}

class _CustomerHomePageScreenState extends State<CustomerHomePageScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  String userID;
  String restaurantID = 'mVIkdMLJkvTkwaRvxqsPFgteNkv1';
  String orderID;
  Query dbRef;
  List<dynamic> lists = [];

  _CustomerHomePageScreenState(){
    user = auth.currentUser;
    userID = user.uid;
    dbRef = FirebaseDatabase.instance.reference().child("Restaurant_Tables")
        .child(restaurantID).child("Tables").orderByChild("employee_ID").equalTo(userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color(0xFFFF0041),
              borderRadius: BorderRadius.circular(50)),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "CUSTOMER",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.credit_card),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => membership_card_screen()));
          },
          label: Text(
            'Scan',
          ),
          icon: Icon(MdiIcons.qrcodeEdit),
          backgroundColor: Color(0xFFFFF0041)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        child: CustomerMainDrawer(),
      ),
      body: Container(
        child: tableListView(),
      ),
    );
  }

  /// This method takes database data into a list. Returns and builds a listView with
  /// listTiles that have database data.
  Widget tableListView() {
    return StreamBuilder(
        stream: dbRef.onValue,
        builder: (context, AsyncSnapshot<Event> event) {
          if (event.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = event.data.snapshot.value;
            if(values != null){
            values.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  orderID = lists[index]["Order_ID"];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ViewTableScreen(lists[index]["Table_Number"].toString(),restaurantID,orderID)));},
                    leading: SvgPicture.asset(
                      "assets/icons/user-1.svg",
                      height: 60,
                      width: 60,
                    ),
                    title: Text("" + lists[index]["User_Name"].toString()),
                    subtitle: Text('Check In: ' +
                        lists[index]["Check_In"].toString() +
                        '\nParty Size ' +
                        lists[index]["Party_Size"].toString()),
                    trailing:
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Text(
                        'Table ' + lists[index]["Table_Number"].toString(),
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
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
                      children:[Text("CALL WAITER TO ADD AN ORDER")]
                  )
              );
            }
          }
          return CircularProgressIndicator();
        });}
    }
