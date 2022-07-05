import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'userprofile.g.dart';

@JsonSerializable()
class UserProfile {
  String? firstName;
  String? lastName;
  int? loyaltyPoints;
  int? fitnessGoal;
  bool? isActive;
  String? id;

  UserProfile(
    this.firstName,
    this.lastName,
    this.loyaltyPoints,
    this.fitnessGoal,
    this.isActive,
    this.id,
  );

  //Manual
  // String toJson() {
  //   Map<String, dynamic> userMap = {
  //     'firstName': this.firstName,
  //     'lastName': this.lastName,
  //     'loyaltyPoints': this.loyaltyPoints,
  //     'fitnessGoal': this.fitnessGoal,
  //     'isActive': this.isActive
  //   };
  //   var data = jsonEncode(userMap);
  //   return data;
  // }

  String toJson() {
    Map<String, dynamic> userMap = _$UserProfileToJson(this);
    var userJson = jsonEncode(userMap);
    print("hasil : $userJson");
    return userJson;
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return _$UserProfileFromJson(json);
  }
}
