import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/features/profile/data/models/user_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserModel model);
  Future<void> signin();
  
}


class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(UserModel model) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email, password: model.password);


      return Right('Signup was succesfull!');
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