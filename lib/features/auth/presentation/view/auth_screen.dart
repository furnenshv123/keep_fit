import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/config/router/router.gr.dart';
import 'package:keep_fit/features/auth/data/models/user_model.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signup_usecase.dart';
import 'package:keep_fit/features/auth/presentation/widgets/button_widget_app.dart';
import 'package:keep_fit/features/auth/presentation/widgets/change_auth_mode.dart';
import 'package:keep_fit/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:keep_fit/themes/colors.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool changeMode = true;
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
            child: Text('Sign up to continue',
                style: TextStyle(
                    fontFamily: "Hanken", color: Colors.white, fontSize: 25)),
          ),
          TextFieldWidget(
              textLabel: 'Username', controller: _usernameController),
          const SizedBox(
            height: 25,
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
          const ButtonWidgetApp(
              labelText: 'Sign up',
              height: 56,
              width: double.infinity,
              fontSize: 25),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              children: [
                const Text(
                  'Do you have an account?',
                  style: TextStyle(
                      fontFamily: "Hanken", color: Colors.white, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                        
                        AutoRouter.of(context).navigate(SignInRoute());
                      
                    },
                    child: const Text(
                      'Sign in',
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
