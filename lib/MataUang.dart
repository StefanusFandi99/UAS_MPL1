import 'package:flutter/material.dart';

class MataUang extends StatefulWidget {
  @override
  _MataUangState createState() => _MataUangState();
}

class _MataUangState extends State<MataUang> {
  String selectedCurrency1 = "Dolar Amerika Serikat";
  String selectedCurrency2 = "Rupiah Indonesia";
  String input = "";
  String result = "";

  void onKeyPress(String key) {
    setState(() {
      if (key == 'C') {
        input = "";
        result = "";
      } else if (key == '←') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else {
        input += key;
      }
      // logic neng kene
      result = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mata Uang'),
        backgroundColor: Color.fromARGB(255, 57, 57, 57),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Refresh logic here
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu selections
            },
            itemBuilder: (BuildContext context) {
              return {'Option 1', 'Option 2', 'Option 3'}
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedCurrency1,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency1 = newValue!;
                      });
                    },
                    items: <String>[
                      'Dolar Amerika Serikat',
                      'Rupiah Indonesia',
                      'Yen Jepang',
                      'Baht Thailand'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: result,
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedCurrency2,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency2 = newValue!;
                      });
                    },
                    items: <String>[
                      'Rupiah Indonesia',
                      'Dolar Amerika Serikat',
                      'Yen Jepang',
                      'Baht Thailand'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: result,
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  '7', '8', '9', '←',
                  '4', '5', '6', '+/-',
                  '1', '2', '3', 'C',
                  '0', '00', '.', '=',
                ].map((key) {
                  return GestureDetector(
                    onTap: () => onKeyPress(key),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: Text(
                          key,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
