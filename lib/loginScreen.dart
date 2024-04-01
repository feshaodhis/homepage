import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'orderScreen.dart'; // Import OrderScreen class

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;

  void _login() {
    // Implement your login logic here
    // For demonstration purposes, let's navigate to the order screen directly
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderScreen()),
    );
  }

  Widget buildPhone(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
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
                    color:Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2),
                  ),
                ]
            ),
            height: 60,
            child: TextField(
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: Colors.black87,
              ) ,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14 ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color:Color(0xff5ac18e),
                  ),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                    color:Colors.black38,
                  )
              ),
            )
        )
      ],
    );
  }
  Widget buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
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
                    color:Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2),
                  ),
                ]
            ),
            height: 60,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ) ,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14 ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color:Color(0xff5ac18e),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color:Colors.black38,
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
  Widget buildRememberCb(){
    return Container(
      height: 20,
      child: Row(
        children:[
          Theme(data: ThemeData(unselectedWidgetColor: Colors.white), child: Checkbox(
            value: isRememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value){
              setState(() {
                isRememberMe =value ?? false;
              });
            },
          )),
          Text(
            "Remember me",
            style: TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold,

            ),
          ),
        ],
      ),
    );
  }
  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:25),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            elevation: 5, backgroundColor: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          child: Text(
              "LOGIN",
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
                  ) ,
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
                      SizedBox(height:20),
                      Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height:10),
                      buildPhone(),
                      SizedBox(height:20),
                      buildPassword(),
                      //SizedBox(height:20),
                      //buildForgotPassBtn(),
                      SizedBox(height:20),
                      buildRememberCb(),
                      SizedBox(height:20),
                      buildLoginBtn(),
                      //SizedBox(height:20),
                      //buildSignUpBtn(),

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
