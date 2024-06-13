import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonSize, Color buttonColor, Color textColor) {
    return Container(
      margin: EdgeInsets.all(2.0), // Adjust margin to make background visible
      height: MediaQuery.of(context).size.width * 0.075 * buttonSize, // Adjust button size to be smaller
      width: MediaQuery.of(context).size.width * 0.075* buttonSize, // Adjust button size to be smaller
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
            child: Text(equation, style: TextStyle(fontSize: equationFontSize)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize)),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.black),
                width: MediaQuery.of(context).size.width * 0.75, // Adjust container width
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                      buildButton("⌫", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                      buildButton("÷", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.white, Colors.black),
                      buildButton("8", 1, Colors.white, Colors.black),
                      buildButton("9", 1, Colors.white, Colors.black),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.white, Colors.black),
                      buildButton("5", 1, Colors.white, Colors.black),
                      buildButton("6", 1, Colors.white, Colors.black),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.white, Colors.black),
                      buildButton("2", 1, Colors.white, Colors.black),
                      buildButton("3", 1, Colors.white, Colors.black),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.white, Colors.black),
                      buildButton("0", 1, Colors.white, Colors.black),
                      buildButton("00", 1, Colors.white, Colors.black),
                    ])
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black), // Set the background color to black
                width: MediaQuery.of(context).size.width * 0.25, // Adjust container width
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("x", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.white, const Color.fromARGB(255, 10, 47, 111)),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, const Color.fromARGB(255, 10, 47, 111), Colors.white),
                    ])
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
