import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/dropdown.dart';
import 'drug.dart';
import 'mpesaScreen.dart';
import 'pickScreen.dart'; // Import PickScreen class

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Drug? _selectedDrug;
  final TextEditingController _quantityController = TextEditingController();


  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  Widget drugsDropdownBtn() {
    var _dropdown = DrugListDropdown(onOptionChanged: (Drug? drug) {
      _selectedDrug = drug;
    });

    return Container(
        width: 600,
        // Adjust the width as needed
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: _dropdown);
  }

  Widget buildQuantity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Enter Quantity",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          child: TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
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
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the MpesaScreen when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MpesaScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
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
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the PickScreen when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PickScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
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

  Widget buildPriceBtn() {
    var quantity = int.tryParse(_quantityController.text) ?? 0;
    var price = _selectedDrug?.price ?? 0; // Default to 0 if _selectedDrug is null

    if (_selectedDrug == null) {
      // Handle the case where no drug is selected (e.g., show a message)
      return const Text("Please select a drug");
    }

    var totalPrice = quantity * price;

    // Optional: Error handling for invalid quantity input (can be enhanced)
    if (quantity == 0 && _quantityController.text.isNotEmpty) {
      return const Text("Invalid quantity. Please enter a number.");
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the MpesaScreen when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MpesaScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          "Price: ${totalPrice.toString()}",
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
                decoration: const BoxDecoration(
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Utibu Health",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Place Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      drugsDropdownBtn(),
                      const SizedBox(height: 20),
                      buildQuantity(context),
                      const SizedBox(height: 20),
                      buildPriceBtn(),
                      const SizedBox(height: 10),
                      buildLipaBtn(),
                      const SizedBox(height: 10),
                      buildPickBtn(),
                      //SizedBox(height:20),
                      //buildSignUpBtn(),
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
