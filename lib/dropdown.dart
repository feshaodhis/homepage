import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedOption;

  // Function to fetch data from Firestore
  Future<List<String>> fetchData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('1').get();
    List<String> data = [];
    querySnapshot.docs.forEach((doc) {
      String itemName = doc.get('drug_name') as String;
      data.add(itemName);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while fetching data
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        List<String>? items = snapshot.data;
        return DropdownButton<String>(
          value: selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
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
          items: items!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value)), // Center the text
            );
          }).toList(),
        );
      },
    );
  }
}
