import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/auth/data/models/user_model.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signup_usecase.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Username'),
            controller: _usernameController,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Email'),
            controller: _emailController,
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Password'),
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 30,
          ),
           ElevatedButton(
              onPressed: () async {
                var result = await getInstance<SignupUsecase>().call(UserModel(
                    username: _usernameController.text,
                    password: _passwordController.text,
                    email: _emailController.text));
                    result.fold((l){
                      var snackBar = SnackBar(content: Text('Registraition failed! Try again'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }, (r){
                      AutoRouter.of(context).navigateNamed('diary');
                    }); 
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: const Text('Регистрация')))
        ],
      ),
    );
  }
}
