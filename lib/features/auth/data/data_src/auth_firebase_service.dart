import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/features/auth/data/models/signin_user_req.dart';
import 'package:keep_fit/features/auth/data/models/user_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserModel model);
  Future<Either> signin(SigninUserReq request);
  
}


class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq request) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: request.email, password: request.password);
      return const Right('Sign in was succesfull!');
    }on FirebaseAuthException catch (e) {
      String message = '';

      if(e.code == 'invalid-email'){
        message = 'Wrong email or password';
      }
      if(e.code == 'invalid-credential'){
        message = 'Wrong email or password';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> signup(UserModel model) async{
    try{
      var userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email, password: model.password);

      FirebaseFirestore.instance.collection('Users').doc(userData.user?.uid).set({
        'email': userData.user?.email,
        'username': model.username
      });
      return const Right('Signup was succesfull!');
    }on FirebaseAuthException catch(e){
      
      String message = '';

      if(e.code == 'weak-password'){
        message = 'Your password is weak';
        
      }else if(e.code == 'email-already-in-use'){
        message = 'Email already in use!';
      }

      return Left(message);
    }
  }

}