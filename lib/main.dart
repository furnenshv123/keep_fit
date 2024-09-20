import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/config/router/router.dart';
import 'package:keep_fit/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  await initializeDependencies();
  runApp(KeepFitApp());
}

class KeepFitApp extends StatelessWidget {
  KeepFitApp ({super.key});

  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
