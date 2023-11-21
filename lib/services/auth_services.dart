import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../data/dummy.dart';

class AuthServices {
// google signin
  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// Register Users
  static addUser(
      {required uid,
      required name,
      required nickname,
      required dob,
      required number,
      required gender,
      required imgUrl}) {
    return FirebaseFirestore.instance.collection('users').doc(uid).set({
      "nickname": nickname,
      "f_name": name,
      "dob": dob,
      "number": number,
      "gender": gender,
      "imgUrl": imgUrl,
      "alternate_transport": alternateTransport,
      "basic_technology": basicTechnology,
      "communication": communication,
      "cpa_long": cpaLong,
      "emp_disaster": empdisaster,
      "f_address": fAddress,
      "food_allergies": foodAllergies,
      "get_notify": getNotify,
      "interested": interested,
      "invest": invest,
      "land_size": landSize,
      "living_style": livingStyle,
      "no_of_adults": noOfAdults,
      "no_of_children": noOfChildren,
      "no_of_vehicle": noOfVehicle,
      "personals_documents": personalsDocuments,
      "pets": pets,
      "safe_room": safeRoom,
      "sec_land_size": secLandSize,
      "secondary_location": secondaryLocation,
    }).then((value) {
      print("Add Users");
    }).onError((error, stackTrace) {
      print("Error" + error.toString());
    });
  }

// Store Image
  static Future uploadImage(File imageFile, uid) async {
    try {
      Reference ref = await FirebaseStorage.instance.ref('/users/' +
          uid +
          "/" +
          DateTime.now().millisecondsSinceEpoch.toString());
      UploadTask uploadTask = ref.putFile(imageFile.absolute);
      await uploadTask.whenComplete(() {});
      String url = await ref.getDownloadURL();
      imgUrl = url;
      // Future.value(uploadTask).then((value) async {

      //   // databaseRef.child('1').set({
      //   //   'id' : '1212' ,
      //   //   'title' : newUrl.toString()
      //   // }).then((value){
      //   //   setState(() {
      //   //     loading = false ;
      //   //   });
      //   //   Utils().toastMessage('uploaded');
      // }).onError((error, stackTrace) {
      //   print(error.toString());
      // });
    } catch (e) {
      print(e);
    }
  }

  // Fetch data

  Future<void> fetchData(String userId) async {
    try {
      // Get a reference to the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get a reference to the 'users' collection and the document with the user ID
      DocumentReference userDocRef = firestore.collection('users').doc(userId);

      // Get the data from the document
      DocumentSnapshot userSnapshot = await userDocRef.get();

      // Check if the document exists
      if (userSnapshot.exists) {
        // Access the data using userSnapshot.data()
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        // Now, you can use 'userData' for further processing
        print('User Data: $userData');
      } else {
        // Handle the case where the document does not exist
        print('User with ID $userId does not exist.');
      }
    } catch (e) {
      // Handle any errors
      print('Error fetching data: $e');
    }
  }

  static Future<void> signOutGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      print("Error signing out: $error");
    }
  }
}
