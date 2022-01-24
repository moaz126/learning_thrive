class TutorModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? disc;

  TutorModel({this.uid, this.email, this.firstName, this.secondName,this.disc});

  // receiving data from server
  factory TutorModel.fromMap(map) {
    return TutorModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      disc:map['disc'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'disc':disc,
    };
  }
}
