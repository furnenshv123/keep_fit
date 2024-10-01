
import 'package:get_it/get_it.dart';
import 'package:keep_fit/features/auth/data/data_src/auth_firebase_service.dart';
import 'package:keep_fit/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:keep_fit/features/auth/domain/repositories/auth_repository.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signin_usecase.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signup_usecase.dart';

final getInstance = GetIt.instance;

Future<void> initializeDependencies() async{
  getInstance.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getInstance.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getInstance.registerSingleton<SignupUsecase>(SignupUsecase());
  getInstance.registerSingleton<SigninUsecase>(SigninUsecase());
}