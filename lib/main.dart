import 'package:flutter/material.dart';
import 'SimpleCalculator.dart';
import 'Pengaturan.dart';
import 'HapusIklan.dart';
import 'KiatPenggunaan.dart';
import 'Bantuan.dart';
import 'MataUang.dart'; // Import the new MataUang page

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Set default text color to white
        ),
      ),
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
        title: Text('Kalkulator', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 57, 57, 57), // Set the background color of the AppBar to grey
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu selections
              if (value == 'Bantuan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bantuan()),
                );
              }
              if (value == 'Hapus Iklan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HapusIklan()),
                );
              }
              if (value == 'Pengaturan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pengaturan()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Bantuan', 'Hapus Iklan', 'Pengaturan'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice, style: TextStyle(color: Colors.black)), // Popup menu text remains black for readability
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
              color: Color.fromARGB(255, 57, 55, 55),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pengaturan()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Pengaturan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5), // Spacing between texts
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HapusIklan()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.lock_open, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Hapus Iklan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5), // Spacing between texts
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KiatPenggunaan()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.question_mark_sharp, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Kiat Penggunaan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Favorit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 14, 204),
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              title: Text('Kalkulator', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
              dense: true,
              onTap: () {
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              title: Text('Mata Uang', style: TextStyle(color: const Color.fromARGB(255, 17, 17, 17))),
              dense: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MataUang()),
                ); // Navigate to MataUang page
              },
            ),
            ListTile(
              title: Text('Satuan', style: TextStyle(color: const Color.fromARGB(255, 37, 37, 37))), // New option added
              dense: true,
              onTap: () {
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              title: Text('Diskon', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))), // New option added
              dense: true,
              onTap: () {
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              title: Text('Pinjaman', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))), // New option added
              dense: true,
              onTap: () {
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
