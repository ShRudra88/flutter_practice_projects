import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(6.0),
                height: 100,
                width: 100,
                color: Colors.black12,

                child: Center(child: Text('0', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black26,
                ),
                decoration: InputDecoration(
                  hintText: 'please enter the amount in USD',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  prefix: Icon(Icons.monetization_on, color: Colors.black,),
                  fillColor: Colors.white30,
                  filled: true,
                ),
              ),
            ),
            TextButton(onPressed: (){}, child: Text('Convert'))
          ],
        ),
      ),
    );
  }
}
