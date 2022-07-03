import 'package:flutter/material.dart';
import 'package:icoma/constant.dart';


class UperSection extends StatelessWidget {
  const UperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Sign Up',
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 48),
        ),
        Text(
          'Create your New Account',
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
