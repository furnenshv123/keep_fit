import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';




@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            ),),
            SizedBox(height: 20,),
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            ),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Container(padding: EdgeInsets.symmetric(horizontal: 100),
              child:  Text('Регистрация')))
          ],
        ),
      );
  }
}