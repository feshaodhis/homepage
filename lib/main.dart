import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import LoginScreen class
import 'orderScreen.dart'; // Import OrderScreen class
import "mpesaScreen.dart";//Import MpesaScreen class
import 'confirmationScreen.dart';
import 'pickScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/order': (context) => OrderScreen(),
        '/mpesa': (context) => MpesaScreen(),
        '/confirmation': (context) => ConfirmationScreen(),
        '/pick': (context) => PickScreen(),
      },
    );
  }
}
