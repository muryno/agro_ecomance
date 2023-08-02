import 'dart:convert';
FriendsResponds friendsRespondsFromJson(String str) => FriendsResponds.fromJson(json.decode(str));
String friendsRespondsToJson(FriendsResponds data) => json.encode(data.toJson());
class FriendsResponds {
  FriendsResponds({
      this.id, 
      this.user1, 
      this.user2,});

  FriendsResponds.fromJson(dynamic json) {
    id = json['id'];
    user1 = json['user1'] != null ? User1.fromJson(json['user1']) : null;
    user2 = json['user2'] != null ? User2.fromJson(json['user2']) : null;
  }
  int id;
  User1 user1;
  User2 user2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user1 != null) {
      map['user1'] = user1.toJson();
    }
    if (user2 != null) {
      map['user2'] = user2.toJson();
    }
    return map;
  }

}

User2 user2FromJson(String str) => User2.fromJson(json.decode(str));
String user2ToJson(User2 data) => json.encode(data.toJson());
class User2 {
  User2({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.native, 
      this.bio, 
      this.phoneNo, 
      this.dateOfBrith, 
      this.avatar, 
      this.rating, 
      this.gender, 
      this.createdAt, 
      this.updatedAt,});

  User2.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    native = json['native'];
    bio = json['bio'];
    phoneNo = json['phone_no'];
    dateOfBrith = json['date_of_brith'];
    avatar = json['avatar'];
    rating = json['rating'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String native;
  String bio;
  String phoneNo;
  String dateOfBrith;
  String avatar;
  double rating;
  String gender;
  String createdAt;
  String updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['native'] = native;
    map['bio'] = bio;
    map['phone_no'] = phoneNo;
    map['date_of_brith'] = dateOfBrith;
    map['avatar'] = avatar;
    map['rating'] = rating;
    map['gender'] = gender;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

User1 user1FromJson(String str) => User1.fromJson(json.decode(str));
String user1ToJson(User1 data) => json.encode(data.toJson());
class User1 {
  User1({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.native, 
      this.bio, 
      this.phoneNo, 
      this.dateOfBrith, 
      this.avatar, 
      this.rating, 
      this.gender, 
      this.createdAt, 
      this.updatedAt,});

  User1.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    native = json['native'];
    bio = json['bio'];
    phoneNo = json['phone_no'];
    dateOfBrith = json['date_of_brith'];
    avatar = json['avatar'];
    rating = json['rating'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String native;
  String bio;
  String phoneNo;
  String dateOfBrith;
  String avatar;
  double rating;
  String gender;
  String createdAt;
  String updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['native'] = native;
    map['bio'] = bio;
    map['phone_no'] = phoneNo;
    map['date_of_brith'] = dateOfBrith;
    map['avatar'] = avatar;
    map['rating'] = rating;
    map['gender'] = gender;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}