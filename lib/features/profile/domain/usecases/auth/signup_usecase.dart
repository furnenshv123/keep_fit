import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/profile/data/models/user_model.dart';
import 'package:keep_fit/features/profile/domain/repositories/auth_repository.dart';

class SignupUsecase implements Usecase<Either, UserModel>{
  @override
  Future<Either> call(UserModel params) {
    return getInstance<AuthRepository>().signup(params);
  }

}