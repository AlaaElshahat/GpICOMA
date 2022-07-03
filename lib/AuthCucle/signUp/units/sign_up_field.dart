import 'package:flutter/material.dart';
import 'package:icoma/AuthCucle/signIn/Component/form_sigin.dart';
import 'package:icoma/AuthCucle/signUp/cubit/cubit.dart';
import 'package:icoma/component/button.dart';
import 'package:icoma/component/textbutton.dart';


class LowerSection extends StatelessWidget {
  const LowerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = SignUpCubit.of(context);
    return Column(
      children: [
        CustomeButton(
          text: 'Sign up',
          function: () async {
            if (cubit.formKey.currentState!.validate()) {
              await cubit.userSignUp(
                password: cubit.passwordController.text,
                email: cubit.emailController.text,
                name: cubit.usernameController.text,
              );
            }
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            CustomeTextButton(
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginForm()),
                );
              },
              text: 'Login',
            )
          ],
        )
      ],
    );
  }
}
