import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/weight/data/data_src/weight_firebase_service.dart';
import 'package:keep_fit/features/weight/data/models/weight_model.dart';
import 'package:keep_fit/features/weight/domain/repositories/weight_repository.dart';

class WeightRepositoryImpl implements WeightRepository{
  @override
  Future<Either> addNewWeight(WeightModel model) async{
    return await getInstance<WeightFirebaseService>().addNewWeight(model);
  }

  @override
  Future<Either> getAllWeights() async{
    return await getInstance<WeightFirebaseService>().getAllWeights();
  }

  @override
  Future<Either> getTarget() async {
    return await getInstance<WeightFirebaseService>().getTarget();
  }
}