
import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:icoma/models/get.dart';

class  UpdatePatient {
  User user;
  File? pateintImage;
  UpdatePatient(this.pateintImage,this.user);
updatePateintProfile(String id) async {
  String imagebase64=base64Encode(pateintImage!.readAsBytesSync());

  var baseUrl = "https://json.loca.lt/api/";
var patientId= user.id.toString(); 
 var response=await http.put(Uri.parse("$baseUrl$patientId"),body: {
  "image":imagebase64,
	"p_img": imagebase64,
 "name": user.name.toString(),
  "age":user.age.toString(),
  "phone_num": user.phoneNum.toString(),
  "genetic_history": user.geneticHistory.toString(),
  "identity": user.identity.toString(),
 "blood_type": user.bloodType.toString(),
 "medicines": user.medicines.toString(),
  "allergies":user.allergies.toString(),
 });
// var  response = await http.put(
// 	Uri.parse("https://jsonglaucoma.herokuapp.com/api/$id"),
// 	headers: {
// 	 "Content-Type" : "application/json"
// 	},
// 	body: jsonEncode(<String, String>{
//     "image":imagebase64,
// 	"p_img": imagebase64,
//  "name": user.name.toString(),
//   "age":"",
//   "phone_num": user.phoneNum.toString(),
//   "genetic_history": user.geneticHistory.toString(),
//   "identity": user.identity.toString(),
//  "blood_type": user.bloodType.toString(),
//  "medicines": user.medicines.toString(),
//   "allergies":user.allergies.toString(),
// 	}),
// );
// if(response.statusCode==200)
// {
//  return User.fromJson(json.decode(response.body));
// }
// else
// {
//   print('failed');
// }
//   print(imagebase64) ;

  }
}
