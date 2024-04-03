import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PriceButton extends StatefulWidget {
  @override
  _PriceButtonState createState() => _PriceButtonState();
}

class _PriceButtonState extends State<PriceButton> {
  // Variable to hold the price fetched from Firestore
  String price = '';

  // Method to fetch price from Firestore
  Future<void> fetchPriceFromFirestore() async {
    try {
      // Replace 'your_collection' with the actual collection name in Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('1')
          .doc('price_document')
          .get();

      // Access the 'price' field from the document
      setState(() {
        price = snapshot.data()['price'].toString();
      });
    } catch (error) {
      // Handle any errors that occur during fetching
      print('Error fetching price: $error');
      // Show a snackbar or toast message to inform the user about the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching price: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fetchPriceFromFirestore,
      child: Text('Show Price: $price'), // Display the price on the button
    );
  }
}
