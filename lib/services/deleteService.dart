import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DeletePateint
{ 
 
 Future<http.Response> deletePateint(String id ) async {
  final http.Response response = await http.delete(
    Uri.parse('https://json.loca.lt/api/delete/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
  
  
}
