import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/profile/data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> signin();
  Future<Either> signup(UserModel model);
}