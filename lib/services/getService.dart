

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:icoma/models/get.dart';

class UserService {
  String baseUrl = "https://json.loca.lt/api";
 Future<List<User>> getPateints() async {
    List<User> usersList = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl");
    var data = response.data;
    data.forEach((userItem) {
      User user = User.fromJson(userItem);
      usersList.add(user);
    });
    return usersList;
  } 
  
}