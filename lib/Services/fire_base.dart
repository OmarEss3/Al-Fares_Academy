import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  Future<bool> checkUserExists(String email, String phone) async {
    try {
      final query = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      final phoneQuery = await _firestore
          .collection('users')
          .where('phone', isEqualTo: phone)
          .get();
      return query.docs.isNotEmpty || phoneQuery.docs.isNotEmpty;
    } catch (e) {
      print('Error checking user existence: $e');
      return false;
    }
  }

  Future<void> saveUserData(Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').add(data);
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCXmEXiQjki5vUFYVhKEAgMET9MeCwykAA",
      authDomain: "moyeser-academey.firebaseapp.com",
      projectId: "moyeser-academey",
      storageBucket: "moyeser-academey.appspot.com",
      messagingSenderId: "173191686386",
      appId: "1:173191686386:web:82df9e9d818477e2d9486b",
      measurementId: "G-37WBVB8L2M",
    ),
  );
}
