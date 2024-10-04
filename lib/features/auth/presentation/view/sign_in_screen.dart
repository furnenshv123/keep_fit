import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/router/router.gr.dart';

import '../../../../themes/colors.dart';
import '../widgets/button_widget_app.dart';
import '../widgets/change_auth_mode.dart';
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.secondForGradient, Color.fromRGBO(50, 65, 65, 1)],
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 90,
          ),
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
          const SizedBox(height: 30,),
          const ButtonWidgetApp(labelText: 'Sign in', height: 56, width: double.infinity, fontSize: 25),
          const SizedBox(height: 5,),
          ChangeAuthMode(mode: 'Sign up', change: (){
            setState(() {
              
              context.router.navigate(AuthRoute());
            });
          },)
        ],
      ),
    );
  }
}