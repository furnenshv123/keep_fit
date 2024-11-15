import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_ingredient_by_name_usecase.dart';
import 'package:keep_fit/features/diary/domain/usecases/meal_add_usecase.dart';

part 'meals_bloc_event.dart';
part 'meals_bloc_state.dart';

class MealsBlocBloc extends Bloc<MealsBlocEvent, MealsBlocState> {


  

  
  MealsBlocBloc() : super(MealsBlocInitial()) {
    on<MealAddProductEvent>((event, emit) {
      emit(MealAddProductState());
    },);
    on<MealUpdateEvent>((event, emit) {
      emit(MealUpdateState());
    },);
    on<MealDeleteProductEvent>((event, emit) {
      emit(MealDeleteProductState(index: event.index));

    },);
    on<MealWeightPost>((event, emit) async {
      var resultIngredient =
          await getInstance<GetIngredientByNameUsecase>().call(event.name);
      resultIngredient.fold((l) {
        emit(MealLoadFailure());
      }, (data) {
        emit(MealAcceptState(
            ingredient: data, index: event.index, weight: event.weight));
      });
    });
    on<MealLoading>(
      (event, emit) {
        emit(MealsBlocLoaded());
      },
    );
    on<MealTransferDataEvent>(
      (event, emit) {
        emit(MealReCount(ingredients: event.ingredients));
      },
    );
    on<MealAddRemoteEvent>(
      (event, emit) async {
        var result = await getInstance<MealAddUsecase>().call(event.entity.toModel());
        result.fold((l) {
          emit(MealLoadFailure());
        }, (r){
          emit(MealAddRemoteDataState());
        });
        
      },
    );
  }

}
