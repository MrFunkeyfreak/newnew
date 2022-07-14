import 'package:cloud_firestore/cloud_firestore.dart';

Future addUserDetails(String username, String email, String firstName,
    String lastName, String birthday, String gender) async {
  await FirebaseFirestore.instance.collection('users').add({
    'username': username,
    'email': email,
    'first name': firstName,
    'last name': lastName,
    'birthdate': birthday,
    'gender': gender,
  });
}
