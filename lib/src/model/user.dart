import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String profileImageUrl;
  String name;
  String email;
  String password;

  User({this.id, this.email, this.password, this.name, this.profileImageUrl});

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      email: doc['email'],
      profileImageUrl: doc['profileImageUrl'],
    );
  }
}
