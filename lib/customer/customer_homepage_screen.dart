import 'package:flutter/material.dart';
import 'package:flutter_app/components/customer_main_drawer.dart';
import 'package:flutter_app/components/employee_main_drawer.dart';
import 'package:flutter_app/components/membership_card_screen.dart';
import 'package:flutter_app/screens/employee_screens/table_info_screen.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_app/firebase/sign_in.dart';

class CustomerHomePageScreen extends StatefulWidget {
  @override
  _CustomerHomePageScreenState createState() => _CustomerHomePageScreenState();
}

class _CustomerHomePageScreenState extends State<CustomerHomePageScreen> {
  final dbRef = FirebaseDatabase.instance.reference().child("Tables").orderByChild("customer_ID").equalTo(userID);
  List<dynamic> lists = [];

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
    return FutureBuilder(
        future: dbRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
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
                      IconButton(
                          icon: Icon(Icons.keyboard_arrow_right),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewTableScreen(lists[index]["Table_Number"].toString())));
                          })
                    ]),
                  );
                });
          }
          return CircularProgressIndicator();
        });
  }
}

///This class is the setup for calling a modal bottomSheet.
void displayModalBottomSheet(context) {
  var bottomSheetController = showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext buildContext) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Color(0xFF737373),
            child: TableInfoScreen(),
          ),
        );
      });
}
