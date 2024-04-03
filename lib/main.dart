import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import LoginScreen class
import 'orderScreen.dart'; // Import OrderScreen class
import "mpesaScreen.dart";//Import MpesaScreen class
import 'confirmationScreen.dart';
import 'pickScreen.dart';
import "signScreen.dart";

Future main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDo7Kqw5ommK7mCHtOhmCRq8aAs7aBzmZ0',
      appId: '1:602210370636:android:5b65e2fc3bf0a166b460e9',
      messagingSenderId: '602210370636',
      projectId: 'utibu-health-ff94d',
      //storageBucket: 'myapp-b9yt18.appspot.com',
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/order': (context) => const OrderScreen(),
        '/mpesa': (context) => const MpesaScreen(),
        '/confirmation': (context) => const ConfirmationScreen(),
        '/pick': (context) => const PickScreen(),
        '/sign': (context) => SignScreen(),
      },
    );
  }
}
