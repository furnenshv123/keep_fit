import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/profile/data/data_src/auth_firebase_service.dart';
import 'package:keep_fit/features/profile/data/models/user_model.dart';
import 'package:keep_fit/features/profile/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(UserModel model) async{
    return await getInstance<AuthFirebaseService>().signup(model);
  }
}