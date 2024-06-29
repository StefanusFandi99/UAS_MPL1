import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:async';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "";
  String result = "";
  String expression = "";
  double fontSize = 50.0;
  bool showCursor = true;
  Timer? cursorTimer;

  @override
  void initState() {
    super.initState();
    startCursorBlinking();
  }

  @override
  void dispose() {
    cursorTimer?.cancel();
    super.dispose();
  }

  void startCursorBlinking() {
    cursorTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        showCursor = !showCursor;
      });
    });
  }

  String getEquationWithCursor() {
    if (equation.isEmpty && result.isEmpty) {
      return showCursor ? "|" : "";
    } else {
      return showCursor ? equation + "|" : equation;
    }
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "";
        result = "";
        fontSize = 50.0;
      } else if (buttonText == "⌫") {
        fontSize = 50.0;
        if (equation.isNotEmpty) {
          equation = equation.substring(0, equation.length - 1);
        }
      } else if (buttonText == "=") {
        fontSize = 50.0;
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
          if (eval == eval.toInt()) {
            result = eval.toInt().toString();
          }
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "()") {
        fontSize = 50.0;
        if (equation.endsWith('(') || equation.isEmpty) {
          equation += "(";
        } else if (equation.contains("(") && !equation.contains(")")) {
          equation += ")";
        } else {
          equation += "(";
        }
      } else if (buttonText == "...") {
        showMoreOptionsDialog();
      } else {
        fontSize = 50.0;
        if (equation.isEmpty) {
          equation = buttonText;
        } else {
          equation += buttonText;
        }
      }
    });
  }

  void showMoreOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fungsi Ilmiah"),
          content: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                shrinkWrap: true,
                children: <String>[
                  "π", "e", "φ",
                  "log", "ln", "^",
                  "√", "∛", "|x|",
                  "sin", "cos", "tan",
                  "sin⁻¹", "cos⁻¹", "tan⁻¹",
                  "sinh", "cosh", "tanh",
                  "sinh⁻¹", "cosh⁻¹", "tanh⁻¹",
                ].map((String value) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (equation.isEmpty) {
                          equation = value;
                        } else {
                          equation += value;
                        }
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text("BATAL"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor, {double height = 70.0, double width = 70.0, double fontSize = 20.0}) {
  return SizedBox(
    width: width,
    height: height,
    child: Container(
      margin: EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          padding: EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0)
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(6, 7, 6, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 120, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    getEquationWithCursor(),
                    style: TextStyle(fontSize: fontSize, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                 Row(
                  children: [
                    buildButton("...", Colors.white, Color.fromARGB(255, 10, 47, 111)),
                    SizedBox(width: 16), // Tambahkan padding antar tombol
                    buildButton("^", Colors.white, Color.fromARGB(255, 10, 47, 111)),
                    SizedBox(width: 16), // Tambahkan padding antar tombol
                    buildButton("⌫", Colors.white, Color.fromARGB(255, 10, 47, 111)),
                  ],
                ),
                ],
              ),
            ),
            Expanded(child: Divider()),
            Container(
              height: 400,
              padding: const EdgeInsets.fromLTRB(0.5, 0.2, 0.5, 0),
              color: Colors.grey,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton("C", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("()", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("%", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("÷", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                  ]),
                  TableRow(children: [
                    buildButton("7", Colors.white, Colors.black, height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("8", Colors.white, Colors.black, height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("9", Colors.white, Colors.black, height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("x", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                  ]),
                  TableRow(children: [
                    buildButton("4", Colors.white, Colors.black, height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("5", Colors.white, Colors.black, height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("6", Colors.white, Colors.black, height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("-", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                  ]),
                  TableRow(children: [
                    buildButton("1", Colors.white, Colors.black,height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("2", Colors.white, Colors.black,height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("3", Colors.white, Colors.black,height: 80.0, width: 80.0, fontSize: 24.0),
                    buildButton("+", Colors.white, Color.fromARGB(255, 10, 47, 111), height: 80.0, width: 80.0, fontSize: 24.0),
                  ]),
                  TableRow(children: [
                    buildButton("0", Colors.white, Colors.black),
                    buildButton("00", Colors.white, Colors.black),
                    buildButton(",", Colors.white, Colors.black),
                    buildButton("=", Color.fromARGB(255, 10, 47, 111), Colors.white),
                  ]),
                ],
              ),
            ),
           Container(
  height: 50,
  padding: const EdgeInsets.fromLTRB(6, 0, 6, 20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(5.0),
      topRight: Radius.circular(5.0),
    ),
  ),
  child: Center(
    child: Image.network(
      'https://cms.dailysocial.id/wp-content/uploads/2023/01/iklan-mie-instan.jpg',
      width: 400,
      height: 180,
      fit: BoxFit.fill, // Mengubah dari BoxFit.fill ke BoxFit.cover
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: SimpleCalculator(),
));
