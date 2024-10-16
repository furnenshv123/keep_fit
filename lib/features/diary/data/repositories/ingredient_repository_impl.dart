import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/diary/data/data_source/ingredient_firebase_service.dart';
import 'package:keep_fit/features/diary/data/models/ingredient_model.dart';

import 'package:keep_fit/features/diary/domain/repositories/ingredient_repository.dart';

class IngredientRepositoryImpl  implements IngredientRepository{
  @override
  Future<Either> getAllIngredients() async{
    return await getInstance<IngredientFirebaseService>().getAllIngredients();
  }
  
  @override
  Future<Either> getIngredientByName(String name) async{
    return await getInstance<IngredientFirebaseService>().getIngredientByName(name);
  }
  
  

}