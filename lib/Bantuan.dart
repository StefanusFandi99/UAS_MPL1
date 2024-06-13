import 'package:flutter/material.dart';

class Bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text('Help Content Goes Here'),
      ),
    );
  }
}
