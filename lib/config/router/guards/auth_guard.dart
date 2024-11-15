import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_fit/config/router/router.gr.dart';

class AuthGuard  extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(FirebaseAuth.instance.currentUser != null){
      resolver.next(true);
      
    }else{
      router.push(const AuthNavigationRoute());
      
    }
  }
}