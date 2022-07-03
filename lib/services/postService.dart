import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostPateint
{
  final fullName ,age , bloodType  ,geneticHistory , phoneNumber ,medicine,allergies,testResult,identity ;
  File? image;
  PostPateint({this.fullName,this.age,this.bloodType,this.geneticHistory,this.phoneNumber,this.identity,
   this.image, this.allergies,this.medicine,this.testResult
  });
  
postPateintInfo() async
{
  
 String imagebase64=base64Encode(image!.readAsBytesSync());
  // String imageName=image!.path.split("/").last;
 var baseUrl = "https://jsonglaucoma.herokuapp.com/api/";
var postEndPoint= "create";
var response= await http.post(Uri.parse("https://json.loca.lt/api/create"),body: {
 
 "image":imagebase64,
 "p_img": "",
 "name": fullName,
  "age": age,
  "phone_num": phoneNumber,
  "genetic_history": geneticHistory,
  "identity": identity,
 "blood_type": bloodType,
 "medicines": medicine,
  "allergies": allergies,
  "test_result": ""
  
 

}, );
 }
 
}
