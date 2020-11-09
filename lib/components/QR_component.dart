import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';


class QR_component extends StatelessWidget {
  String _dataString = 'Hello';
  BuildContext context;

  QR_component(String dataString,BuildContext bc){
    _dataString = dataString;
    context = bc;
  }

  @override
  Widget build(BuildContext context) {
    return _contentWidget();
  }


  _contentWidget() {
    return  Container(
        height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width/1.5,
        margin:EdgeInsets.only(left:25,right:20,top:10,),

       color: Color(0x00000000),
       child:  Column(
         children: <Widget>[
           Expanded(
              child:  Center(
                child: RepaintBoundary(
                  child: QrImage(
                    data: _dataString,
                    size: MediaQuery.of(context).size.height/2,
                  ),
                ),
              ),
           ),
         ],
       ),
    );
  }
}