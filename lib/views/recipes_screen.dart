import 'package:flutter/material.dart';
import 'package:recipe_veg/services/preference.services.dart';
import 'package:recipe_veg/views/signInscreen.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipes"),
          actions: [
            IconButton(
                onPressed: () async {
                  PreferencService.logout();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));
                  var email = await PreferencService.loginData();
                  print("output======> $email ========>");
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(
                'assets/images/pic1.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          //child: Center(child: Text(""),),
        ));
  }
}
