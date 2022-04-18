import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_thrive/messaging/constants/constants.dart';

class UserChat {
  String uid;
  String photoUrl;
  String firstName;
  String lastName;
  String disc;
  double rating;

  UserChat(
      {required this.uid,
      required this.photoUrl,
      required this.firstName,
      required this.lastName,
      required this.disc,
      required this.rating});

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.firstName: firstName,
      FirestoreConstants.lastName: lastName,
      FirestoreConstants.aboutMe: disc,
      FirestoreConstants.photoUrl: photoUrl,
      FirestoreConstants.rating: rating,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String disc = "";
    String photoUrl = "";
    String firstName = "";
    String lastName = "";
    double rating = 0.0;
    try {
      disc = doc.get(FirestoreConstants.disc);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      firstName = doc.get(FirestoreConstants.firstName);
    } catch (e) {}
    try {
      rating = doc.get(FirestoreConstants.rating);
    } catch (e) {}
    try {
      lastName = doc.get(FirestoreConstants.lastName);
    } catch (e) {}
    return UserChat(
      uid: doc.id,
      photoUrl: photoUrl,
      firstName: firstName,
      lastName: lastName,
      disc: disc,
      rating: rating,
    );
  }
}
