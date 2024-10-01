import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/auth/data/models/signin_user_req.dart';
import 'package:keep_fit/features/auth/domain/repositories/auth_repository.dart';

class SigninUsecase implements Usecase <Either, SigninUserReq>{
  @override
  Future<Either> call(SigninUserReq params) async{
    return await getInstance<AuthRepository>().signin(params);
  }

}