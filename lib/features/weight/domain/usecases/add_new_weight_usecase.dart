import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/weight/domain/repositories/weight_repository.dart';

class AddNewWeightUsecase  extends Usecase<Either, dynamic>{
  @override
  Future<Either> call(params) async{
    return await getInstance<WeightRepository>().addNewWeight(params);
  }
  
}