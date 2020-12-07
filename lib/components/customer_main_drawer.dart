import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/customer/customer_sign_in_screen.dart';
import 'package:flutter_app/customer/edit_customer_account_screen.dart';
import 'package:flutter_app/firebase/sign_in.dart';
import 'package:flutter_app/screens/edit_creditcart/edit_creditcard.dart';
import 'package:flutter_app/screens/settings/settings_screen.dart';

class CustomerMainDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage mStorage = FirebaseStorage.instance;
  StorageReference defaultImageURL = FirebaseStorage.instance.ref().child("profile_picture_default.PNG");
  User user;
  String name;
  String imageURL = "";
  CustomerMainDrawer(){
    user = auth.currentUser;
    name = user.displayName;
    setImage();
  }

  setImage() async{
    if ( user.photoURL != null){
      imageURL = user.photoURL;
    }
    else {
      await defaultImageURL.getDownloadURL().then((value) {
        imageURL = value.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(imageURL),
              ),
              SizedBox(height: 5.0),
              Text("Hello",
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
              SizedBox(height: 5.0),
              Text(name + "!",
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditCustomerAccount()));
        },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Your Profile"),
      ),
      
      ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditCreditCard()));
        },
        leading: Icon(
          Icons.credit_card,
          color: Colors.black,
        ),
        title: Text("Payment Method"),
      ),
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Setting()));
        },
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Settings"),
      ),
      ListTile(
        onTap: () {
          signOut();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return CustomerSignInScreen();
          }), ModalRoute.withName('/'));
        },
        leading: Icon(
          Icons.power_settings_new,
          color: Colors.black,
        ),
        title: Text("Log out"),
      ),
    ]);
  }
}
