import 'package:flutter/material.dart';

class Bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 57, 57, 57),
      ),
      body: Center(
        child: Text('Bantuan'),
      ),
    );
  }
}
