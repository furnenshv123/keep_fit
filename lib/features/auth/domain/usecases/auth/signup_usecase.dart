import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/auth/data/models/user_model.dart';
import 'package:keep_fit/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase implements Usecase<Either, UserModel>{
  @override
  Future<Either> call(UserModel params) {
    return getInstance<AuthRepository>().signup(params);
  }

}