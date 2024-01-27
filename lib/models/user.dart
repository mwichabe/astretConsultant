class UserModelOne {
  String uid;
  String? yourName;
  String? email;
  String? phoneNumber;
  String? profilePictureUrl;

  UserModelOne({
    required this.uid,
    this.yourName,
    this.email,
    this.phoneNumber,
    this.profilePictureUrl,
  });
  // data from server
  factory UserModelOne.fromMap(map) {
    return UserModelOne(
      uid: map['uid'],
      yourName: map['yourName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      profilePictureUrl: map['profilePictureUrl'],
    );
  }
// sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'yourName': yourName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
