import 'package:flutter/material.dart';
import 'package:recipe_veg/services/preference.services.dart';
import 'package:recipe_veg/views/recipes_screen.dart';
import 'package:recipe_veg/views/signInscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(
                  'assets/images/pic1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                      child: Image(
                          image: AssetImage(
                        'assets/images/pic1.jpg',
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to be Veggin",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.purple,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (PreferencService.isLoggedIn()) {
                          var email = await PreferencService.loginData();
                          print("output======> $email ========>");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipesScreen(),
                              ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ));
                        }

                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.restaurant_menu_sharp),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Get Started",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.orangeAccent),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ) // Your app content goes here
            ));
  }
}
