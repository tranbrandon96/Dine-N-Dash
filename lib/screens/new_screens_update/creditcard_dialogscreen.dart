import 'package:flutter/material.dart';

class creditcard_dialogscreen extends StatefulWidget {
  @override
  _creditcard_dialogscreenState createState() => _creditcard_dialogscreenState();
}

class _creditcard_dialogscreenState extends State<creditcard_dialogscreen> {
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
    );
  }
}

  void _balanceprint_screenDialog(context){
    showDialog(context: context, builder: (BuildContext bc){
      return  AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),

          title: Text('Credit Card Transaction?'),
          content: ImageIcon(AssetImage("assets/images/creditcarddialog.png"),
            color: const Color(0xfffd1040),
            size: 100,),
          actions: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                          'YES'
                      ),
                      color: const Color(0xfffd1040),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      )

                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: RaisedButton(
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
                ),
              ],
            ),
          ],

      );
    });
  }