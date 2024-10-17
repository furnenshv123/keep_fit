import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_ingredient_by_name_usecase.dart';

part 'meals_bloc_event.dart';
part 'meals_bloc_state.dart';

class MealsBlocBloc extends Bloc<MealsBlocEvent, MealsBlocState> {
  MealsBlocBloc() : super(MealsBlocInitial()) {
    on<MealWeightPost>((event, emit) async {
      var resultIngredient = await getInstance<GetIngredientByNameUsecase>().call(event.name);
      resultIngredient.fold((l){
        emit(MealLoadFailure());
      }, (data){
        emit(MealAcceptState(ingredient: data, index: event.index, weight: event.weight));
      });
    });
  }
}
