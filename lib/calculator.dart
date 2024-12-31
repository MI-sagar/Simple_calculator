import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '0';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (btnText == '=') {
      numTwo = double.parse(result);
      if (opr == '+') {
        finalResult = (numOne + numTwo).toString();
      } else if (opr == '-') {
        finalResult = (numOne - numTwo).toString();
      } else if (opr == 'x') {
        finalResult = (numOne * numTwo).toString();
      } else if (opr == '/') {
        finalResult = numTwo == 0 ? "Error" : (numOne / numTwo).toString();
      }
      result = finalResult;
      opr = '';
    } else if (['+', '-', 'x', '/'].contains(btnText)) {
      if (result.isNotEmpty) {
        numOne = double.parse(result);
      }
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (double.parse(result) / 100).toString();
      finalResult = result;
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result = result.startsWith('-')
          ? result.substring(1)
          : '-' + result;
      finalResult = result;
    } else {
      result = result == '0' ? btnText : result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Calculator',
            style: TextStyle(color: Colors.cyanAccent, fontSize: 25)),
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10),
              child: Text(
                '$text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(color: Colors.cyanAccent, thickness: 1),
            ..._buildButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtons() {
    return [
      _buildRow(['AC', '+/-', '%', '/']),
      _buildRow(['7', '8', '9', 'x']),
      _buildRow(['4', '5', '6', '-']),
      _buildRow(['1', '2', '3', '+']),
      _buildRow(['0', '.', '=']),
    ];
  }

  Widget _buildRow(List<String> texts) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: texts.map((text) {
          return Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                backgroundColor: text == '='
                    ? Colors.cyanAccent
                    : Colors.blueGrey[800],
                shape: CircleBorder(),
              ),
              onPressed: () => calculation(text),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
