import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // 1. Declare result and textEditingController as state variables
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  // 4. Dispose the controller when the widget is removed from the widget tree
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    // 3. Update state using setState
    setState(() {
      // Basic error handling for empty or invalid input
      if (textEditingController.text.isNotEmpty) {
        try {
          result = double.parse(textEditingController.text) * 81;
        } catch (e) {
          // Handle parsing errors, e.g., show a snackbar or set result to an error state
          if (kDebugMode) {
            print("Error parsing input: $e");
          }
          result = 0; // Or some error indicator
        }
      } else {
        result = 0; // Reset if input is empty
      }
    });
    if (kDebugMode) {
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(6.0),
                // To make the container size dynamic based on text,
                // you might consider removing fixed height/width or using a different approach.
                // For simplicity, keeping it as is for now.
                height: 100,
                width: 300, // Increased width to better display larger numbers
                color: Colors.black12,
                child: Center(
                    child: Text(
                      result.toStringAsFixed(2), // Format to 2 decimal places
                      style: const TextStyle(
                          fontSize: 55, fontWeight: FontWeight.bold),
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // 2. Use the state variable controller
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black, // Changed for better visibility
                ),
                decoration: const InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  prefixIcon: Icon( // Use prefixIcon for better alignment
                    Icons.monetization_on,
                    color: Colors.black,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  // Adding a border for better visual appearance
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true), // Set keyboard type for numbers
              ),
            ),
            TextButton(
              onPressed: _convertCurrency, // Call the conversion method
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                foregroundColor: WidgetStateProperty.all(Colors.white), // Set text color
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 18),
                ),
              ),
              child: const Text('Convert'),
            )
          ],
        ),
      ),
    );
  }
}
