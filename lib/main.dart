import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import LoginScreen class
import 'orderScreen.dart'; // Import OrderScreen class
import "mpesaScreen.dart";//Import MpesaScreen class
import 'confirmationScreen.dart';
import 'pickScreen.dart';

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
