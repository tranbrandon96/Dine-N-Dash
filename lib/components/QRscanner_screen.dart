import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class QRscanner_screen extends StatefulWidget {
  @override
  _QRscanner_screen createState() => new _QRscanner_screen();
}

class _QRscanner_screen extends State<QRscanner_screen> {
  String qr;
  bool camState = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child:Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: camState
                  ? QrCamera(
                          onError: (context, error) => Text(
                            error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          qrCodeCallback: (code) {
                            setState(() {
                              qr = code;
                              camState = false;
                            });
                          }
                      )
                  : Container()
            ),
            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
    );
  }


}