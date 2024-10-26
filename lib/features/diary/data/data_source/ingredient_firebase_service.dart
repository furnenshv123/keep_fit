import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:keep_fit/features/diary/data/models/ingredient_model.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';

abstract class IngredientFirebaseService {
  Future<Either> getAllIngredients();
  Future<Either> getIngredientByName(String name);
}

class IngredientFirebaseServiceImpl implements IngredientFirebaseService{
  @override
  Future<Either> getAllIngredients() async{
    try {
  List<IngredientEntity>? ingredients = [];
  var data = await FirebaseFirestore.instance.collection("Ingredients").get();
  for(var element in data.docs){
    var ingredient = IngredientModel.fromMap(element.data());
    ingredients.add(ingredient.toEntity());
    
  }
  return Right(ingredients);
} on Exception catch (e) {
  return Left(e);
}
  }
  
  @override
  Future<Either> getIngredientByName(String name) async{
    try {
  var data = await FirebaseFirestore.instance.collection("Ingredients").where('name', isEqualTo: name).get();
  var ingredient = data.docs.map((e)=> IngredientModel.fromMap(e.data())).single.toEntity();
  
  return Right(ingredient);
} on Exception catch (e) {
  return Left(e);
}
    
  }

}