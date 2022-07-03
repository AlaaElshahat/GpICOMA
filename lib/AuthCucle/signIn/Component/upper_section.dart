import 'package:flutter/material.dart';
import 'package:icoma/constant.dart';


class UperSection extends StatelessWidget {
  const UperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Sign In',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize:32 ),),
        Text('Login to your account',style: TextStyle(color:  kPrimaryColor,fontWeight: FontWeight.bold,fontSize:16),)
      ],
    );
  }
}
