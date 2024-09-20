import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/features/profile/data/models/user_model.dart';

abstract class AuthFirebaseService {
  Future<void> signup(UserModel model);
  Future<void> signin();
  
}


class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(UserModel model) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email, password: model.password);
    }on FirebaseAuthException catch(e){

    }
  }

}