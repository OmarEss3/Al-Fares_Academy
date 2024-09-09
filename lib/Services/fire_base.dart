import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  Future<bool> checkUserExists(String email, String phone) async {
    log('Checking if user exists...');
    try {
      final query = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('phone', isEqualTo: phone)
          .get();

      if (query.docs.isEmpty) {
        log('No user found in the database.');
        return false;
      }

      log('Query completed. Docs found: ${query.docs.length}');
      return true;
    } catch (e) {
      log('Error checking user existence: ${e.toString()}');
      return false;
    }
  }

  Future<void> saveUserData(
      BuildContext context, Map<String, dynamic> data) async {
    log('Attempting to save user data: ${data['email']}, ${data['phone']}');
    try {
      await _firestore.collection('users').add(data);
      log('User data saved successfully!');

      // Navigate to the WebView to send the email
 
    } catch (e) {
      log('Error saving user data: $e');
    }
  }
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBN4_AZecGEvvoB8dFC5900A3Pe6sy5Wdc",
      authDomain: "alfaresacademy-38ccc.firebaseapp.com",
      projectId: "alfaresacademy-38ccc",
      storageBucket: "alfaresacademy-38ccc.appspot.com",
      messagingSenderId: "712382609693",
      appId: "1:712382609693:web:c3917f204a51c2000089f4",
      measurementId: "G-F5EK68KQSF",
    ),
  );
}

// Future<void> testFirestore() async {
//   try {
//     final query = await FirebaseFirestore.instance.collection('users').get();
//     for (var doc in query.docs) {
//       print(doc.data());
//     }
//   } catch (e) {
//     log('Error querying Firestore: $e');
//   }
// }
