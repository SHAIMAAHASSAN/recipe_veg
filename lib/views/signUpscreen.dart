import 'package:flutter/material.dart';
import 'package:recipe_veg/views/signInscreen.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[50],
        title: Text('Sign Up',style: TextStyle(fontSize: 25,color: Colors.deepPurple)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.
                  only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),

                  ),
                  child: Image(image: AssetImage(
          'assets/images/pic3.jpg',
          )),
                ),
              ),
             // SizedBox(height: 20,),
              //CircleAvatar(backgroundImage:AssetImage("images/emergency.png") ,maxRadius: 80,) ,
              Container(margin: EdgeInsets.only(right: 10,left: 10,top: 15,bottom: 15),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'User name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10,bottom: 15,left: 10),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    return null;
                  },
                ),
              ),
              Container(margin: EdgeInsets.only(right: 10,bottom: 15,left: 10),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon( obscureText ? Icons.visibility : Icons.visibility_off,),
                      onPressed: () {
                        setState(() {

                          obscureText = !obscureText;

                        });
                      },
                    ),
                    prefixIcon: Icon(Icons.lock_outline_sharp),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(

                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Sign up the user with Firebase Authentication.

                    // Navigate to the next screen.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}