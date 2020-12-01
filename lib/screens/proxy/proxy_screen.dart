import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';
import 'package:image_picker/image_picker.dart';

class Proxy extends StatefulWidget {
  @override
  _ProxyState createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  String userID;
  String restaurantID = "mVIkdMLJkvTkwaRvxqsPFgteNkv1";
  DatabaseReference db;
  Query managerDB;
  Query bartenderDB;
  Query waiterDB;
  List<dynamic>lists = [];

  _ProxyState(){
    db = FirebaseDatabase.instance.reference().child("Restaurant_Employees").child(restaurantID);
    waiterDB = db.orderByChild("position").equalTo("Waiter");
    bartenderDB = db.orderByChild("position").equalTo("Bartender");
    managerDB = db.orderByChild("position").equalTo("Manager");

  }
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
        body: SingleChildScrollView(
            child: Column(
                
                children: <Widget>[
                  ExpansionTile(
                    title:  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Manager',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    children:[employeeView(managerDB)]

                  ),
              Divider(color: Colors.black),
                  ExpansionTile(
                      title:  SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Bartender',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children:[employeeView(bartenderDB)]

                  ),
              Divider(color: Colors.black),
                  ExpansionTile(
                      title:  SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Waiter',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children:[employeeView(waiterDB)]

                  ),
              Divider(color: Colors.black),
            ])));
  }

  /// This method takes database data into a list. Returns and builds a listView with
  /// listTiles that have database data.
  Widget employeeView(Query dbRef) {return FutureBuilder(
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
                      Navigator.pop(context,lists[index]["userID"].toString());
                    },
                    title: Text("" + lists[index]["userName"].toString()),
                  );
                });
          }
          else{
            return Center(
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[Text("None Available")]
                )
            );
          }
        }
        return CircularProgressIndicator();
      });
  }
}
