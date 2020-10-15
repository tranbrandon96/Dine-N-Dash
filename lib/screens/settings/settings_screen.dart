import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _lights = false;
  bool _lights2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 30.0,
            color: const Color(0xfffd1040),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(children: <Widget>[
          SwitchListTile(
            title: Text("Notifications"),
            value: _lights,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            activeColor: Colors.green,
            inactiveTrackColor: Colors.red,
          ),
          Divider(
            color: Colors.black,
          ),
          SwitchListTile(
            title: Text("Sounds"),
            value: _lights2,
            onChanged: (bool value) {
              setState(() {
                _lights2 = value;
              });
            },
            activeColor: Colors.green,
            inactiveTrackColor: Colors.red,
          ),
          Divider(
            color: Colors.black,
          ),
        ]));
  }
}
