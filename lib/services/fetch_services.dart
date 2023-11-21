import 'package:cloud_firestore/cloud_firestore.dart';

class FetchServices {
  static String? docId;
  static dynamic productData;
  // static Future<void> fetchAllDataFromCollection(String collectionName) async {
  //   try {
  //     // Get a reference to the Firestore instance
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;

  //     // Reference the collection from which you want to retrieve all documents
  //     CollectionReference collectionRef = firestore.collection(collectionName);

  //     // Retrieve all documents in the collection
  //     QuerySnapshot querySnapshot = await collectionRef.get();

  //     // Iterate through the documents
  //     querySnapshot.docs.forEach((DocumentSnapshot doc) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       // Process the data as needed
  //       print('Document ID: ${doc.id}, Data: $data');
  //       docId = doc.id;
  //       productData = data;
  //       return;
  //     });
  //   } catch (e) {
  //     // Handle any errors
  //     print('Error fetching data: $e');
  //   }
  // }

  static Future<List<Map<String, dynamic>>?> fetchAllDataFromCollection(
      String collectionName) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionRef = firestore.collection(collectionName);

      QuerySnapshot querySnapshot = await collectionRef.get();

      List<Map<String, dynamic>> dataList =
          querySnapshot.docs.map((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
