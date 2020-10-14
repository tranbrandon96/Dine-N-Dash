import 'package:flutter/material.dart';

class add_creditcard extends StatefulWidget {
  @override
  _add_creditcardState createState() => _add_creditcardState();
}

class _add_creditcardState extends State<add_creditcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffd1040),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Add Payment Method',
          style: TextStyle(
            fontSize: 28.0,
            fontFamily: 'Futura',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
            child: Text(
              'Add New Card Information',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 25,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )
        ),
      ),

            Container(
                child: TextField(
                 // controller: _controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xfffd1040)),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xfffd1040)),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    prefixIcon: Icon(Icons.credit_card),
                    hintText: '1234 \t1234\t 1234\t 1234\t\t'
                  ),
                  ),
              padding: EdgeInsets.fromLTRB(50,0,50,0),
            ),
              Container(
                padding: EdgeInsets.all(25.0),
                child: Center(
                    child: Text(
                      'This payment method will be added to your account. You will not be charged until you pay in restaurant',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 15,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50,200,50,0),
                child: Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {},
                    child: Text(
                        'SAVE'
                    ),
                    textColor: Colors.white,
                    color: const Color(0xfffd1040),
                  ),

                ),
              ),

                ],
      ),
        )
    );
  }
}
