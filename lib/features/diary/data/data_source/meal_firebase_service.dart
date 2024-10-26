import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';

abstract class MealFirebaseService {
  Future<Either> getMealsFromDate(DateTime date);
  Future<Either> addMeals(MealModel meal);
}

class MealFirebaseServiceImpl implements MealFirebaseService {
  @override
  Future<Either> addMeals(MealModel meal) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Meals")
          .doc(meal.date + meal.name)
          .set(meal.toMap());
      return const Right('Succes!');
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getMealsFromDate(DateTime date) async {
    try {
  var user = FirebaseAuth.instance.currentUser;
  String uid = user!.uid;
  var data = await FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Meals')
      .where('date',
          isEqualTo: date.day.toString() +
              date.month.toString() +
              date.year.toString())
      .get();
  var meals = data.docs.map((e)=>MealModel.fromMap(e.data()).toEntity()).toList();
  return Right(meals);
} on Exception catch (e) {
  return Left(e);
}
    
  }
}
