import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String username;
  final String password;
  final String email;

  UserModel({required this.username, required this.password, required this.email});
  
  @override
  // TODO: implement props
  List<Object?> get props => [username, email, password];
}