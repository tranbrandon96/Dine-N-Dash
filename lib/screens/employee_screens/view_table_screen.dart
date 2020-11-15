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
  ViewTableScreen(String tableNumber){
    _tableNumber = tableNumber;
  }
  _ViewTableScreen createState() =>  _ViewTableScreen(_tableNumber);

}

class _ViewTableScreen extends State<ViewTableScreen>{
  String _tableNumber;
  String customerName = "Guest";
  String partySize = '1';
  DatabaseReference db;
  List<ExpansionTile> menuItems;

  _ViewTableScreen(String tableNumber){
    _tableNumber = tableNumber;
    db = FirebaseDatabase.instance.reference().child("Tables").child("Table"+ tableNumber);
  }

  init(){
    super.initState();
  }


  Widget build (BuildContext context){
      menuItems = [
    ExpansionTile(
      title: Text('\t\tDouble Double'),
      subtitle: Text('\t\t + Animal Style' + '\n\t\t -  No Pickles'),
      trailing: Text('\$4.25\t\t'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            FlatButton(color:Colors.purple,onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => DiscountScreen()));}, child:Text('DISCOUNT',style:TextStyle(color:Colors.white,fontSize:15))),
            FlatButton(color:Colors.orangeAccent,onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ViewTableScreen(_tableNumber)));}, child:Text('EDIT',style:TextStyle(color:Colors.white,fontSize:15))),
            FlatButton(color:Colors.red,onPressed: (){}, child:Text('REMOVE',style:TextStyle(color:Colors.white,fontSize:15))),
          ]
        )
      ],
    ),
  ];
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
            icon: Icon(Icons.add, color: Color(0xFFFF0041), size:35,),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => CategoryScreen()));
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
    return FutureBuilder(
      future: db.once(),
    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
    if (snapshot.hasData) {
      customerName = "Guest";
      Map<dynamic, dynamic> values=snapshot.data.value;
      partySize = values["Party_Size"].toString();
      customerName = values["User_Name"].toString();
          };
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
                        Text('Edit Table',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,)),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.grey, size:25,),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => QRscanner_screen(_tableNumber)))
                                .then((value) {  setState((){ });  });
                          },
                        ),
                      ]),
                ),
              ),
              Container(
                height: 450,
                child: ListView(children: menuItems),
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
                        _button('CHECKOUT', CheckoutScreen()),

                      ],
                    ),
                    RaisedButton(
                      onPressed: () {displayModalBottomSheet(context);  },
                      color:Color(0xFFFF0041),
                      child: Text(
                          'SUBMIT',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewTableScreen(_tableNumber)));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewTableScreen(_tableNumber)));
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
              height:MediaQuery.of(context).size.height/1,
              color: Color(0xFF737373),
              child:ReviewOrderScreen(),
            ),
          );
        }
    );
  }


