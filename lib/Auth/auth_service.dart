import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Create user document in Firestore
      await _firestore.collection('users').doc(authResult.user!.uid).set({
        'displayName': displayName,
        'email': email,
        'password':password,
        // Add more user information as needed
      });

      return authResult.user;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get userStream => _auth.authStateChanges();

}

