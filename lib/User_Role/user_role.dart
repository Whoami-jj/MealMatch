import 'package:cloud_firestore/cloud_firestore.dart';

class UserRoleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> getUserRole(String userId) async {
    try {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(userId).get();

      return userDoc['role'];
    } catch (e) {
      print('Error getting user role: $e');
      return null;
    }
  }
}