import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginScreen.dart'; // Import OrderScreen class

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  bool? isRememberMe = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() {
    // Implement your login logic here
    // For demonstration purposes, let's navigate to the order screen directly
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]
            ),
            height: 60,
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xff5ac18e),
                  ),
                  hintText: "Register Email",
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  )
              ),
            )
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]
            ),
            height: 60,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff5ac18e),
                  ),
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  )
              ),
            )
        )
      ],
    );
  }

  // Widget buildForgotPassBtn(){
  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: ElevatedButton(
  //       onPressed: () => print("Forgot Password Pressed"),
  //       style: ElevatedButton.styleFrom(
  //         elevation: 5, backgroundColor: Colors.white,
  //         padding: EdgeInsets.all(15),
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15)
  //         ),
  //       ),
  //       //padding: EdgeInsets.only(right: 0),
  //       child: Text(
  //           "Forgot Password",
  //           style: TextStyle(
  //             color:Colors.grey,
  //             fontWeight: FontWeight.bold,
  //           )
  //
  //
  //       ),
  //
  //     ),
  //   );
  // }
  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value ?? false;
                  });
                },
              )),
          Text(
            "Remember me",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          ),
        ],
      ),
    );
  }

  Future<User?> _registerUsingEmailPassword({
    required String email,
    required String password,

  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    return user;
  }

  void _register() async {
    User ? user = await _registerUsingEmailPassword(
        email: _emailController.text, password: _passwordController.text);
    if (user != null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> LoginScreen()),
      );
    }
  }

  Widget buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: _register,

          style: ElevatedButton.styleFrom(
            elevation: 5, backgroundColor: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          child: Text(
              "Sign Up",
              style: TextStyle(
                color: Color(0xff5ac18e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
          )
      ),
    );
  }

  // Widget buildSignUpBtn(){
  //   return GestureDetector(
  //     onTap: () =>print("Sign Up Pressed"),
  //     child: RichText(
  //       text: TextSpan(
  //           children: [
  //             TextSpan(
  //                 text: "Don\'t have an account",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w500,
  //
  //                 )
  //             ),
  //             TextSpan(
  //                 text: "Sign Up",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //
  //                 )
  //             )
  //           ]
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x665ac18E),
                          Color(0x995ac18E),
                          Color(0xCC5ac18E),
                          Color(0xff5ac18E),

                        ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Utibu Health",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      //SizedBox(height:20),
                      //buildForgotPassBtn(),
                      SizedBox(height: 20),
                      buildRememberCb(),
                      // SizedBox(height:20),
                      // buildLoginBtn(),
                      SizedBox(height: 20),
                      buildSignUpBtn(),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}