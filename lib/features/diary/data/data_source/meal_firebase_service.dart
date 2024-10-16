import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';

abstract class MealFirebaseService {
  Future<Either> getMealsFromDate(DateTime date);
  Future<Either> addMeals(MealModel meal);
}

class MealFirebaseServiceImpl extends MealFirebaseService{
  @override
  Future<Either> addMeals(MealModel meal) async {
    try {
  var user = FirebaseAuth.instance.currentUser;
  String uid = user!.uid;
  await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Meals").add(meal.toMap());
  return Right('Succes!');
} on Exception catch (e) {
  return Left(e);
}
    
  }

  @override
  Future<Either> getMealsFromDate(DateTime date) {
    // TODO: implement getMealsFromDate
    throw UnimplementedError();
  }

}