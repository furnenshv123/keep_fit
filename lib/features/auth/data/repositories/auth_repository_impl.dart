import 'package:dartz/dartz.dart';

import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/auth/data/data_src/auth_firebase_service.dart';
import 'package:keep_fit/features/auth/data/models/signin_user_req.dart';
import 'package:keep_fit/features/auth/data/models/user_model.dart';
import 'package:keep_fit/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signin(SigninUserReq request) async{
    return await getInstance<AuthFirebaseService>().signin(request);
  }

  @override
  Future<Either> signup(UserModel model) async{
    return await getInstance<AuthFirebaseService>().signup(model);
  }
}