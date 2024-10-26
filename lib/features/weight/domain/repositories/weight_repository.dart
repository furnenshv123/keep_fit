import 'package:dartz/dartz.dart';
import 'package:keep_fit/features/weight/data/models/weight_model.dart';

abstract class WeightRepository {
  Future<Either> getAllWeights();
  Future<Either> addNewWeight(WeightModel model);
  Future<Either> getTarget();
}