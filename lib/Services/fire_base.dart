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
  apiKey: "AIzaSyBN4_AZecGEvvoB8dFC5900A3Pe6sy5Wdc",
  authDomain: "alfaresacademy-38ccc.firebaseapp.com",
  projectId: "alfaresacademy-38ccc",
  storageBucket: "alfaresacademy-38ccc.appspot.com",
  messagingSenderId: "712382609693",
  appId: "1:712382609693:web:c3917f204a51c2000089f4",
  measurementId: "G-F5EK68KQSF"
    ),
  );
}
