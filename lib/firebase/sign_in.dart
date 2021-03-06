import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

// Add these three variables to store the info
// retrieved from the FirebaseUser
String name;
String email;
String imageUrl;
String userID;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;



  //FirebaseDatabase.instance.reference('users/' + user.uid + "/profile").set(firebase.auth().currentUser);
  if (user != null) {
    // Add the following lines after getting the user
    // Checking if email and name is null
    //assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    if(authResult.additionalUserInfo.isNewUser == true) {
      //Add user to database
      DatabaseReference userDB = FirebaseDatabase.instance.reference().child(
          "Users").child(user.uid).child("profile");
      userDB.set({
        "userID": user.uid,
        "userName": user.displayName,
        "userEmail": user.email
      });
    }
    // Store the retrieved data
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    userID = user.uid;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    // ...

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

Future<void>  signOut() async {
    await _auth.signOut();
   }