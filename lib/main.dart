import 'package:flutter/material.dart';
import 'SimpleCalculator.dart'; // Assuming SimpleCalculator.dart is in the same directory as main.dart

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Calculator(),
      debugShowCheckedModeBanner: false, // Hide the debug banner
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.grey, // Set the background color of the AppBar to grey
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu selections
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return {'Option 1', 'Option 2', 'Option 3', 'Option 4'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 46, 46, 46),
              height: 100,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Pengaturan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Kalculator'),
              onTap: () {
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              title: Text('Mata Uang'),
              onTap: () {
                // You can add navigation to another screen if needed
                Navigator.pop(context); // close the drawer
              },
            ),
          ],
        ),
      ),
      body: SimpleCalculator(),
    );
  }
}
