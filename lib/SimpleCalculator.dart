import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String displayText = "0";
  String equation = "0";
  double displayFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        displayText = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
        displayText = equation;
      } else if (buttonText == "=") {
        String expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          displayText = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          displayText = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
        displayText = equation;
      }
    });
  }

  Widget buildButton(String buttonText, double buttonSize, Color buttonColor, Color textColor) {
    return Container(
      margin: EdgeInsets.all(2.0), // Adjust margin to make background visible
      height: MediaQuery.of(context).size.width * 0.075 * buttonSize, // Adjust button size to be smaller
      width: MediaQuery.of(context).size.width * 0.075 * buttonSize, // Adjust button size to be smaller
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.0), // Add rounded corners
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Add rounded corners here
            side: BorderSide(
              color: Color.fromARGB(255, 186, 183, 183),
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold, // Set font weight to bold
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey, // Set the background color to grey
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(displayText, style: TextStyle(fontSize: displayFontSize)),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.black),
                width: MediaQuery.of(context).size.width * 1, // Adjust container width
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                      buildButton("⌫", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                      buildButton("x", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                      buildButton("÷", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.white, Colors.black),
                      buildButton("8", 1, Colors.white, Colors.black),
                      buildButton("9", 1, Colors.white, Colors.black),
                      buildButton("x", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.white, Colors.black),
                      buildButton("5", 1, Colors.white, Colors.black),
                      buildButton("6", 1, Colors.white, Colors.black),
                      buildButton("-", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.white, Colors.black),
                      buildButton("2", 1, Colors.white, Colors.black),
                      buildButton("3", 1, Colors.white, Colors.black),
                      buildButton("+", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("0", 1, Colors.white, Colors.black),
                      buildButton("00", 1, Colors.white, Colors.black),
                      buildButton(",", 1, Colors.white, Colors.black),
                      buildButton("=", 1, const Color.fromARGB(255, 10, 47, 111), Colors.white),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: SimpleCalculator(),
    ),
  ));
}
