import 'package:flutter/foundation.dart';
import '../constants/enums.dart';

class FormUser {
  UserType userType;
  String email;
  String password;
  String shopName;
  String bio;
  String category;
  String shopAddress;
  FormUser.customer({
    @required this.email,
    @required this.password,
    this.userType = UserType.customer,
  });
  FormUser.mershant({
    @required this.email,
    @required this.password,
    this.userType = UserType.mershant,
    @required this.shopName,
    @required this.bio,
    @required this.category,
    @required this.shopAddress,
  });
  factory FormUser.map(Map map) {
    if (map['isMershant']) {
      return FormUser.mershant(
        email: map['email'],
        password: map['password'],
        shopName: map['shopName'],
        bio: map['bio'],
        category: map['category'],
        shopAddress: map['shopAddress'],
      );
    } else {
      return FormUser.customer(
        email: map['email'],
        password: map['password'],
      );
    }
  }
  Map<String, dynamic> toMap() {
    Map map = this.userType == UserType.customer
        ? {
            'isMershant': false,
            'email': this.email,
            'password': this.password,
          }
        : {
            'isMershant': true,
            'email': this.email,
            'password': this.password,
            'shopName': this.shopName,
            'shopAddress': this.shopAddress,
            'bio': this.bio,
            'category': this.category,
          };
    return {...map};
  }
}
