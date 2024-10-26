import 'package:get_it/get_it.dart';
import 'package:keep_fit/features/auth/data/data_src/auth_firebase_service.dart';
import 'package:keep_fit/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:keep_fit/features/auth/domain/repositories/auth_repository.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signin_usecase.dart';
import 'package:keep_fit/features/auth/domain/usecases/auth/signup_usecase.dart';
import 'package:keep_fit/features/diary/data/data_source/ingredient_firebase_service.dart';
import 'package:keep_fit/features/diary/data/data_source/meal_firebase_service.dart';
import 'package:keep_fit/features/diary/data/repositories/ingredient_repository_impl.dart';
import 'package:keep_fit/features/diary/data/repositories/meal_repository_impl.dart';
import 'package:keep_fit/features/diary/domain/repositories/ingredient_repository.dart';
import 'package:keep_fit/features/diary/domain/repositories/meal_repository.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_all_ingredients_usecase.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_ingredient_by_name_usecase.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_meals_from_date_usecase.dart';
import 'package:keep_fit/features/diary/domain/usecases/meal_add_usecase.dart';
import 'package:keep_fit/features/weight/data/data_src/weight_firebase_service.dart';
import 'package:keep_fit/features/weight/data/repositories/weight_repository_impl.dart';
import 'package:keep_fit/features/weight/domain/repositories/weight_repository.dart';
import 'package:keep_fit/features/weight/domain/usecases/add_new_weight_usecase.dart';
import 'package:keep_fit/features/weight/domain/usecases/get_all_weights_usecase.dart';
import 'package:keep_fit/features/weight/domain/usecases/get_target_usecase.dart';

final getInstance = GetIt.instance;

Future<void> initializeDependencies() async {
  getInstance.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getInstance.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getInstance.registerSingleton<SignupUsecase>(SignupUsecase());
  getInstance.registerSingleton<SigninUsecase>(SigninUsecase());
  getInstance.registerSingleton<IngredientFirebaseService>(
      IngredientFirebaseServiceImpl());
  getInstance
      .registerSingleton<IngredientRepository>(IngredientRepositoryImpl());
  getInstance
      .registerSingleton<GetAllIngredientsUsecase>(GetAllIngredientsUsecase());
  getInstance.registerSingleton<MealFirebaseService>(MealFirebaseServiceImpl());
  getInstance.registerSingleton<MealRepository>(MealRepositoryImpl());
  getInstance.registerSingleton<GetIngredientByNameUsecase>(
      GetIngredientByNameUsecase());
  getInstance.registerSingleton<MealAddUsecase>(MealAddUsecase());
  getInstance
      .registerSingleton<GetMealsFromDateUsecase>(GetMealsFromDateUsecase());
  getInstance
      .registerSingleton<WeightFirebaseService>(WeightFirebaseServiceImpl());
  getInstance.registerSingleton<WeightRepository>(WeightRepositoryImpl());
  getInstance.registerSingleton<GetTargetUsecase>(GetTargetUsecase());
  getInstance.registerSingleton<AddNewWeightUsecase>(AddNewWeightUsecase());
  getInstance.registerSingleton<GetAllWeightsUsecase>(GetAllWeightsUsecase());
}
