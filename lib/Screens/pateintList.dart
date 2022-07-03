import 'package:flutter/material.dart';
import 'package:icoma/Screens/addpateint.dart';
import 'package:icoma/component/bottom_nav_bar.dart';
import 'package:icoma/component/rounded_app_bar.dart';
import 'package:icoma/constant.dart';

class PateintsList extends StatefulWidget {
  const PateintsList({ Key? key }) : super(key: key);

  @override
  State<PateintsList> createState() => _PateintsListState();
}

class _PateintsListState extends State<PateintsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:RoundAppBar(),
      body:Stack(
        children:[ Center(
         child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           padding:EdgeInsets.symmetric(vertical: 10.0) ,
           child:AddPateint()
         ),
           ),
            const MyBottomNavBar()
           ]
      ),
     
    );
      
    
  }
}