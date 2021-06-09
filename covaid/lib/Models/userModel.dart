class UserModel {
  String uid;
  String name;
  String email;
  String username;
  String bio;
  String profilePhoto;
  String phoneNumber;
  int createdAt;
  int verified;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.bio,
    this.createdAt,
    this.phoneNumber,
    this.profilePhoto,
    this.verified,
  });

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data["bio"] = user.bio;
    data["phoneNumber"] = user.phoneNumber;
    data["profile_photo"] = user.profilePhoto;
    data["createdAt"] = user.createdAt;
    data["verified"] = user.verified;
    return data;
  }

  // Named constructor
  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.username = mapData['username'];
    this.bio = mapData['bio'];
    this.profilePhoto = mapData['profile_photo'];
    this.createdAt = mapData['createdAt'];
    this.phoneNumber = mapData['phoneNumber'];
    this.verified = mapData['verified'];
  }
}
