import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_thrive/messaging/constants/constants.dart';

class UserChat {
  String uid;
  String photoUrl;
  String firstName;
  String lastName;
  String disc;

  UserChat(
      {required this.uid,
      required this.photoUrl,
      required this.firstName,
      required this.lastName,
      required this.disc});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.firstName: firstName,
      FirestoreConstants.lastName: lastName,
      FirestoreConstants.aboutMe: disc,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String disc = "";
    String photoUrl = "";
    String firstName = "";
    String lastName = "";
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
      lastName = doc.get(FirestoreConstants.lastName);
    } catch (e) {}
    return UserChat(
      uid: doc.id,
      photoUrl: photoUrl,
      firstName: firstName,
      lastName: lastName,
      disc: disc,
    );
  }
}
