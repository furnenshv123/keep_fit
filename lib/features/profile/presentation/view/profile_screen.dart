import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/profile/data/models/user_model.dart';
import 'package:keep_fit/features/profile/domain/usecases/auth/signup_usecase.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Username'),
            controller: _usernameController,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Email'),
            controller: _emailController,
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Password'),
            controller: _passwordController,
            obscureText: true,
          ),
          SizedBox(
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
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text('Регистрация')))
        ],
      ),
    );
  }
}
