import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/config/router/router.gr.dart';
import 'package:keep_fit/features/auth/data/models/signin_user_req.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signin_usecase.dart';

import '../../../../themes/colors.dart';
import '../widgets/button_widget_app.dart';

import '../widgets/text_field_widget.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool changeMode = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.gradientApp),
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Divider(),
          const Text(
            'Welcome!',
            style: TextStyle(
                fontFamily: "Hanken",
                color: AppColors.defaultText,
                fontSize: 30),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Text('Sign in to continue',
                style: TextStyle(
                    fontFamily: "Hanken", color: Colors.white, fontSize: 25)),
          ),
          TextFieldWidget(textLabel: 'Email', controller: _emailController),
          const SizedBox(
            height: 25,
          ),
          TextFieldWidget(
            textLabel: 'Password',
            controller: _passwordController,
            obscureMod: true,
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidgetApp(
            labelText: 'Sign in',
            height: 56,
            width: double.infinity,
            fontSize: 25,
            onTap: () async{
              var result = await getInstance<SigninUsecase>().call(SigninUserReq(
                  email: _emailController.text,
                  password: _passwordController.text));
              result.fold((l){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
              }, (r){
                AutoRouter.of(context).navigate(const DiaryRoute());
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              children: [
                const Text(
                  "You don't have an account?",
                  style: TextStyle(
                      fontFamily: "Hanken", color: Colors.white, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      AutoRouter.of(context).navigate(const AuthRoute());
                    },
                    child: const Text(
                      'Sign up',
                      style: const TextStyle(
                          fontFamily: "Hanken",
                          color: AppColors.dedicatedText,
                          fontSize: 20),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
