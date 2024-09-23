import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either> call(Params params);
}