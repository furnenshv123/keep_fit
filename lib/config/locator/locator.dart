import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:keep_fit/features/profile/data/data_src/auth_firebase_service.dart';
import 'package:keep_fit/features/profile/data/repositories/auth_repository_impl.dart';
import 'package:keep_fit/features/profile/domain/repositories/auth_repository.dart';

final getInstance = GetIt.instance;

Future<void> initializeDependencies() async{
  getInstance.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getInstance.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}