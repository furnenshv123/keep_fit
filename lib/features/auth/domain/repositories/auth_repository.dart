import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/auth/data/models/signin_user_req.dart';
import 'package:keep_fit/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUserReq request);
  Future<Either> signup(UserModel model);
}