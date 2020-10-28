import 'package:flutter/material.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_app/screens/new_screens_update/employee_memberlink.dart';


class DiscountScreen extends StatefulWidget {
  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, size: 35),
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Discount',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Futura',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),


          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ManagerApprovalScreen()));
                      },
                      child: Text(
                          '15%'
                      ),
                      textColor: Colors.white,
                      color: const Color(0xfffd1040),
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ManagerApprovalScreen()));},
                      child: Text(
                          '25%'
                      ),
                      textColor: Colors.white,
                      color: const Color(0xfffd1040),
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ManagerApprovalScreen()));},
                      child: Text(
                          '35%'
                      ),
                      textColor: Colors.white,
                      color: const Color(0xfffd1040),
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ManagerApprovalScreen()));},
                      child: Text(
                          '50%'
                      ),
                      textColor: Colors.white,
                      color: const Color(0xfffd1040),
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ManagerApprovalScreen()));},
                      child: Text(
                          'COMP'
                      ),
                      textColor: Colors.white,
                      color: const Color(0xfffd1040),
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ManagerApprovalScreen()));},
                      child: Text(
                          'OTHER'
                      ),
                      textColor: Colors.white,
                      color: const Color(0xfffd1040),
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    ),
                  ),
                ),
//                Container(
//                  child: TextField(
//                    // controller: _controller,
//                    decoration: InputDecoration(
//                        enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                                color: const Color(0xfffd1040)),
//                            borderRadius: BorderRadius.all(Radius.circular(20))
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                                color: const Color(0xfffd1040)),
//                            borderRadius: BorderRadius.all(Radius.circular(20))
//                        ),
//                        prefixIcon: Icon(Icons.credit_card),
//                        hintText: '1234 \t1234\t 1234\t 1234\t\t'
//                    ),
//                  ),
//                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
//                ),
                Container(
                  padding: EdgeInsets.all(25.0),
                  child: Center(
                    child: Text(
                      'Please note that discounts greater than 15% require manager approval.',
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


              ],
            ),
          )
      );
    }
  }
