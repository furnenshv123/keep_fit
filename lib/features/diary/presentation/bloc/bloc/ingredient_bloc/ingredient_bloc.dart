import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_all_ingredients_usecase.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_ingredient_by_name_usecase.dart';

part 'ingredient_event.dart';
part 'ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  IngredientBloc() : super(IngredientInitial()) {
    on<IngredientGetEvent>((event, emit) async{
      var resultIngredients =await getInstance<GetAllIngredientsUsecase>().call('');
      resultIngredients.fold((l){
        emit(IngredientLoadFailure());
      }, (data){
        emit(IngerdientLoaded(listIngredients: data));
      });
    });
    on<IngredientWeightPost>((event, emit) async{
      var resultIngredient = await getInstance<GetIngredientByNameUsecase>().call(event.name);
      resultIngredient.fold((l){
        emit(IngredientLoadFailure());
      }, (data){
        emit(IngredientAcceptState(ingredient: data));
      });
    },);
  }
}
