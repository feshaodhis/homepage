import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mpesaScreen.dart';
import 'pickScreen.dart'; // Import PickScreen class

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedOption = "Panadol";
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget drugsDropdownBtn() {
    return Container(
      width: 600, // Adjust the width as needed
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue!;
          });
        },
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 30.0,
        elevation: 16,
        underline: SizedBox(),
        alignment: Alignment.center, // Align the dropdown options to the center
        items: <String>['Panadol', 'Arvs', 'Celestamin', 'Cough Cyrup']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value)), // Center the text
          );
        }).toList(),
      ),
    );
  }

  Widget buildQuantity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Quantity",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
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
            ],
          ),
          height: 60,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.keyboard,
                color: Color(0xff5ac18e),
              ),
              hintText: "Number",
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
            onChanged: (value) {
              // You can handle the input value here
              print('Input value: $value');
            },
          ),
        ),
      ],
    );
  }

  Widget buildLipaBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the MpesaScreen when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MpesaScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          "Lipa na Mpesa",
          style: TextStyle(
            color: Color(0xff5ac18e),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildPickBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the PickScreen when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PickScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          "Pay When You Pick",
          style: TextStyle(
            color: Color(0xff5ac18e),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

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
                    ],
                  ),
                ),
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
                        "Place Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      drugsDropdownBtn(),
                      SizedBox(height: 20),
                      buildQuantity(context),
                      SizedBox(height: 10),
                      buildLipaBtn(),
                      SizedBox(height: 10),
                      buildPickBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
