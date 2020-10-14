import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


//This screen is only designed for the use of showDialog Alert feature
class balanceprint_screen extends StatefulWidget {
  @override
  _balanceprint_screenState createState() => _balanceprint_screenState();
}

class _balanceprint_screenState extends State<balanceprint_screen> {
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
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.print,
              color: Colors. white,
              size: 30,),
        padding: const EdgeInsets.only(right:15),
              onPressed: (){
                _balanceprint_screenDialog(context);
              },
    )
    ],
          title: Text(
            'Table Number ',
            style: TextStyle(
              fontSize: 28.0,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        body: SizedBox(
          child: Column(
            children: <Widget>[
              Container(
                child: Text('Open tab details...'),
                  color:Colors.red,
                alignment: Alignment.center,
                margin: EdgeInsets.all(50),
                ),

//              AlertDialog(
//                title: Text('Print Receipt?'),
//                content: Icon(Icons.print,
//                size: 80,),
//                actions: [
//                  RaisedButton(
//                      onPressed: () {},
//                      child: Text(
//                          'YES'
//                      ),
//                      color: const Color(0xfffd1040),
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(100))
//                      )
//
//                  ),
//                  RaisedButton(
//                      onPressed: () {},
//                      child: Text(
//                          'NO',
//                        style: TextStyle(
//                          color: const Color(0xfffd1040)
//                        ),
//                      ),
//                      color: Colors.white,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(100))
//                    )
//
//                  ),
//                ],
//              )







            ],
          ),
        ),
    );
  }
  void _balanceprint_screenDialog(context){
    showDialog(context: context, builder: (BuildContext bc){
      return Center(
        child: AlertDialog(
              title: Text('Print Receipt?'),
              content: Icon(Icons.print,
                size: 80,),
              actions: [
                RaisedButton(
                    onPressed: () {},
                    child: Text(
                        'YES'
                    ),
                    color: const Color(0xfffd1040),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    )

                ),
                RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'NO',
                      style: TextStyle(
                          color: const Color(0xfffd1040)
                      ),
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    )

                ),
              ],
            ),
      );
    });
  }
}