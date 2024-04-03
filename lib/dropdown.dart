import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'drug.dart'; // Import Firestore

class DrugListDropdown extends StatefulWidget {
  final void Function(Drug?) onOptionChanged;
  const DrugListDropdown({super.key, required this.onOptionChanged});

  @override
  _DrugListDropdownState createState() => _DrugListDropdownState();
}

class _DrugListDropdownState extends State<DrugListDropdown> {
  String? selectedOption;

  // Function to fetch data from Firestore
  Future<List<Drug>> fetchData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('1').get();
    List<Drug> data = [];
    for (var doc in querySnapshot.docs) {
      var itemName = doc.get('drug_name') as String;
      var price = int.parse(doc.get("price"));
      data.add(Drug(itemName, price));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Drug>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while fetching data
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        List<Drug>? items = snapshot.data;
        return DropdownButton<String>(
          value: selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
              widget.onOptionChanged(items.firstWhere((drug) => drug.drugName == selectedOption));
            });
          },
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30.0,
          elevation: 16,
          underline: const SizedBox(),
          alignment: Alignment.center, // Align the dropdown options to the center
          items: items!.map<DropdownMenuItem<String>>((Drug value) {
            return DropdownMenuItem<String>(
              value: value.drugName,
              child: Center(child: Text(value.drugName)), // Center the text
            );
          }).toList(),
        );
      },
    );
  }
}
