import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/features/weight/data/models/target_model.dart';
import 'package:keep_fit/features/weight/data/models/weight_model.dart';

abstract class WeightFirebaseService {
  Future<Either> getAllWeights();
  Future<Either> addNewWeight(WeightModel model);
  Future<Either> getTarget();
}

class WeightFirebaseServiceImpl extends WeightFirebaseService {
  @override
  Future<Either> addNewWeight(WeightModel model) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      var addResult = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Weights")
          .add(model.toMap());
      return Right('Succes!');
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getAllWeights() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      var result = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Weights")
          .get();
      var weights = result.docs
          .map(
            (e) => WeightModel.fromMap(e.data()).toEntity(),
          )
          .toList();
      return Right(weights);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getTarget() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      var data = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Target")
          .get();
      var target =
          data.docs.map((e) => TargetModel.fromMap(e.data())).single.toEntity();
      return Right(target);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
