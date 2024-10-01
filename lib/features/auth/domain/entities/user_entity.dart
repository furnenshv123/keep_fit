import 'package:equatable/equatable.dart';

class UserEntity  extends Equatable{
  UserEntity({required this.username, required this.email, required this.password});
  final String username;
  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [username, password, email];

}