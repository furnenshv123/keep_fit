import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/weight/domain/entities/target_entity.dart';
import 'package:keep_fit/features/weight/domain/entities/weight_entity.dart';
import 'package:keep_fit/features/weight/domain/usecases/add_new_weight_usecase.dart';
import 'package:keep_fit/features/weight/domain/usecases/get_all_weights_usecase.dart';
import 'package:keep_fit/features/weight/domain/usecases/get_target_usecase.dart';

part 'weight_event.dart';
part 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightInitial()) {
    on<WeightEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<WeightInitEvent>(
      (event, emit) async {
        emit(WeightLoaded());
        var result = await getInstance<GetTargetUsecase>().call('');
        var weights = await getInstance<GetAllWeightsUsecase>().call('');
        var list;
        weights.fold((l){
          emit(WeightLoadFailure());
        }, (data){
          list = data;
        });
        result.fold((l) {
          emit(WeightLoadFailure());
        }, (data) {
          emit(WeightInitTargetsWeights(entity: data, weights: list));
        });
      },
    );
    on<WeightAddEvent>(
      (event, emit) async {
        var result = await getInstance<AddNewWeightUsecase>()
            .call(WeightEntity(weight: event.weight, date: event.date).toModel());
        result.fold((l){
          emit(WeightLoadFailure());
        }, (r){
          emit(WeightAddDay(entity: WeightEntity(weight: event.weight, date: event.date)));
        });
      },
    );
  }
}
