import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'orderScreen.dart'; // Import LoginScreen class

class ConfirmationScreen extends StatefulWidget {
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {


  Widget buildBackHomeBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:25),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            // Navigate to LoginScreen when Back Home button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 5, backgroundColor: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          child: Text(
              "Back Home",
              style: TextStyle(
                color: Color(0xff5ac18e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
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
                      SizedBox(height:50),
                      Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 100,
                      ),
                      SizedBox(height:50),
                      Text(
                        "Paid",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      buildBackHomeBtn(),
                      SizedBox(height:20),
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
