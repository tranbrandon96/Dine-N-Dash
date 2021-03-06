import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/components/QRscanner_screen.dart';
import 'package:flutter_app/screens/employee_screens/checkout_screen.dart';
import 'package:flutter_app/screens/employee_screens/review_order_screen.dart';
import 'package:flutter_app/screens/food/category.dart';
import 'package:flutter_app/screens/new_screens_update/discount_screen.dart';
import 'package:flutter_svg/svg.dart';

class ViewTableScreen extends StatefulWidget{
  String _tableNumber;
  String restaurantID = 'mVIkdMLJkvTkwaRvxqsPFgteNkv1';
  String orderID;
  ViewTableScreen(String tableNumber, this.restaurantID, this.orderID){
    _tableNumber = tableNumber;
  }
  _ViewTableScreen createState() =>  _ViewTableScreen(_tableNumber, restaurantID,orderID);

}

class _ViewTableScreen extends State<ViewTableScreen>{
  String _tableNumber;
  String customerName = "Guest";
  String partySize = '1';
  String restaurantID = '';
  String orderID;
  Map<dynamic, dynamic>items = {};
  DatabaseReference db;
  DatabaseReference orderReference;

  _ViewTableScreen(String tableNumber, this.restaurantID,this.orderID){
    _tableNumber = tableNumber;
    db = FirebaseDatabase.instance.reference().child("Restaurant_Tables").child(restaurantID).child('Tables').child("Table"+ tableNumber);
    orderReference = FirebaseDatabase.instance.reference().child("Orders").child(orderID).child('Items');
  }

  init(){
    super.initState();
  }



  Widget build (BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFFFF0041), size:35,),
            onPressed: () {Navigator.pop(context);}
          ),
          actions: [
            IconButton(
            icon: Icon(Icons.restaurant_menu_rounded, color: Color(0xFFFF0041), size:35,),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => CategoryScreen(restaurantID,_tableNumber))).then((value){
                setState(() {});
              });
            },
          ),
          ],
          title: Text( "Table " + _tableNumber,
            style: TextStyle(
              color: Colors.black,),),
          backgroundColor: Colors.white,
        ),
      ),
      body: tableView(),
    );
  }


  Widget tableView() {
    return StreamBuilder(
      stream: db.onValue,
    builder: (context, AsyncSnapshot<Event> event) {
    if (event.hasData) {
      Map<dynamic, dynamic> values=event.data.snapshot.value;
      partySize = values["Party_Size"].toString();
      customerName = values["User_Name"].toString();
          }
    return new ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return  Column(
            children:<Widget>[
              SizedBox(height: 5),
              Container(
                height: 100,
                child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/user-1.svg",
                    height: 65,
                    width: 65,
                  ),
                  title: Text(customerName, style: TextStyle(fontSize: 25)),
                  subtitle: Text('Party Size: ' + partySize),
                  trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Text('Scan Customer',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,)),
                        IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.grey, size:25,),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => QRscanner_screen(_tableNumber,restaurantID)))
                                .then((value) {  setState((){ });  });
                          },
                        ),
                      ]),
                ),
              ),

              Container(
                height: 450,
                child: menuItemsBuilder(),
              ),

              Divider(
                color: Colors.grey,
                height: 5,
                thickness: 1,
              ),

              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        RaisedButton(
                          onPressed: () {BalancePrintPopup(context); },
                          color:Color(0xFFFF0041),
                          child: Text(
                              'BALANCE PRINT',
                              style: TextStyle(color: Colors.white, fontSize:15,fontWeight: FontWeight.bold)),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        _button('CHECKOUT', CheckoutScreen(_tableNumber,restaurantID,orderID)),

                      ],
                    ),
                    RaisedButton(
                      onPressed: () {displayModalBottomSheet(context,_tableNumber,restaurantID,orderID);  },
                      color:Color(0xFFFF0041),
                      child: Text(
                          'SUBMIT ORDER',
                          style: TextStyle(color: Colors.white, fontSize:15,fontWeight: FontWeight.bold)),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
        });
  }

  Widget menuItemsBuilder() {
    return StreamBuilder(
        stream: orderReference.onValue,
        builder: (context, AsyncSnapshot<Event> event) {
          if (event.hasData && event != null) {
            items = event.data.snapshot.value;
          }
          if (items != null) {
            List lists = [];
            items.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                      children:[
                        ExpansionTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('\t\t'+ lists[index]['Item_Name']+'\n\t\t'+
                                    "Status: "+ lists[index]["Status"].toString()),
                                Text("Qty: "+ lists[index]["Quantity"].toString()+"\t\t"),
                              ]),
                          subtitle: Column(
                            children: modificationBuilder(lists[index]["Modifications"]),
                          ),
                          trailing: Text('\$'+ lists[index]["Price"].toStringAsFixed(2) + '\t\t'),
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:[
                                  FlatButton(color:Colors.purple,onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => DiscountScreen()));}, child:Text('DISCOUNT',style:TextStyle(color:Colors.white,fontSize:15))),
                                  FlatButton(color:Colors.orangeAccent,onPressed: (){}, child:Text('EDIT',style:TextStyle(color:Colors.white,fontSize:15))),
                                  FlatButton(color:Colors.red,onPressed: (){
                                    db.child('Items').child(lists[index]["Key"]).remove().then((value){
                                      setState(() { });
                                    });
                                  }, child:Text('REMOVE',style:TextStyle(color:Colors.white,fontSize:15))),
                                ]
                            )
                          ],
                        ),
                        (index != lists.length - 1) ?
                        Divider(
                          color: Colors.grey,
                          height: 5,
                          indent: MediaQuery.of(context).size.width/9,
                          endIndent: MediaQuery.of(context).size.width/9,
                          thickness: 1,
                        ) : Container()

                      ]
                  );

                }
            );
          }
          else {return Text("ADD TO YOUR ORDER");}
        }
    );

  }

  List<Widget> modificationBuilder(Map<dynamic, dynamic> modifications){
    List<Widget> lists = [];
      if(modifications != null) {
        modifications.forEach((key, values) {
          if(values == true){
            lists.add(Text("\t\t"+key.toString()));
          }
        });
    }
      return lists;
  }


  Widget _button(String text, Object page){
    return RaisedButton(
      onPressed: () { if(page != null){  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => page));}  },
      color:Color(0xFFFF0041),
      child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize:15,fontWeight: FontWeight.bold)),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }

  void BalancePrintPopup(context) {
    showDialog(context: context, builder: (BuildContext bc) {
      return AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),

        ),
        title: Text('Print Receipt?', textAlign: TextAlign.center,),
        content: ImageIcon(AssetImage("assets/images/chefhat.png"),
          color: const Color(0xfffd1040),
          size: 100,),
        actions: [
          Row(children: [
            Container(
              padding: EdgeInsets.fromLTRB(0,0,70,0),
              child: Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                      'YES'
                  ),
                  textColor: Colors.white,
                  color: const Color(0xfffd1040),
                ),

              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0,0,30,0),
              child: Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                      'NO'
                  ),
                  textColor: Colors.white,
                  color: const Color(0xfffd1040),
                ),

              ),
            ),
          ],
          )
        ],
      );
    });
  }

}

 ///This class is the setup for calling ReviewOrder submission.
  void displayModalBottomSheet(context,tableNumber,restaurantID,orderID) {
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
              height:MediaQuery.of(context).size.height/1,
              color: Color(0xFF737373),
              child:ReviewOrderScreen(tableNumber,restaurantID,orderID),
            ),
          );
        }
    );
  }




