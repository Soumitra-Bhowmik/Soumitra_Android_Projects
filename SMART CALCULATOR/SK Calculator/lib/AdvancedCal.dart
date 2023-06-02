import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  double _result = 0.0;
  String _memory = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _input = '';
        _result = 0.0;
      } else if (buttonText == 'C') {
        _input = _input.substring(0, _input.length - 1);
      } else if (buttonText == '=') {
        try {
          _result = eval(_input);
        } catch (e) {
          _result = 0.0;
        }
        _input = _result.toString();
      } else if (buttonText == 'M+') {
        _memory = (_memory.isEmpty ? '0' : _memory);
        _memory = (double.parse(_memory) + double.parse(_input)).toString();
      } else if (buttonText == 'M-') {
        _memory = (_memory.isEmpty ? '0' : _memory);
        _memory = (double.parse(_memory) - double.parse(_input)).toString();
      } else if (buttonText == 'MR') {
        _input = _memory;
      } else if (buttonText == '+/-') {
        if (_input.startsWith('-')) {
          _input = _input.substring(1);
        } else {
          _input = '-' + _input;
        }
      } else if (buttonText == '%') {
        try {
          _result = eval(_input) / 100.0;
        } catch (e) {
          _result = 0.0;
        }
        _input = _result.toString();
      } else {
        _input += buttonText;
      }
    });
  }

  double eval(String expression) {
    List<String> tokens = tokenize(expression);
    return evaluate(tokens);
  }

  List<String> tokenize(String expression) {
    List<String> tokens = [];
    String currentToken = '';

    for (int i = 0; i < expression.length; i++) {
      String c = expression[i];
      if (isNumber(c) || c == '.') {
        currentToken += c;
      } else if (isOperator(c)) {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        tokens.add(c);
      } else if (c == '(' || c == ')') {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        tokens.add(c);
      }
    }

    if (currentToken.isNotEmpty) {
      tokens.add(currentToken);
    }

    return tokens;
  }

  double evaluate(List<String> tokens) {
    List<String> operators = [];
    List<double> operands = [];

    for (String token in tokens) {
      if (isNumber(token)) {
        operands.add(double.parse(token));
      } else if (isOperator(token)) {
        while (operators.isNotEmpty &&
            precedence(operators.last) >= precedence(token)) {
          String op = operators.removeLast();
          double b = operands.removeLast();
          double a = operands.removeLast();
          operands.add(applyOp(a, b, op));
        }
        operators.add(token);
      } else if (token == '(') {
        operators.add(token);
      } else if (token == ')') {
        while (operators.last != '(') {
          String op = operators.removeLast();
          double b = operands.removeLast();
          double a = operands.removeLast();
          operands.add(applyOp(a, b, op));
        }
        operators.removeLast();
      }
    }
    while (operators.isNotEmpty) {
      String op = operators.removeLast();
      double b = operands.removeLast();
      double a = operands.removeLast();
      operands.add(applyOp(a, b, op));
    }

    return operands.last;
  }

  bool isNumber(String token) {
    try {
      double.parse(token);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isOperator(String token) {
    return token == '+' || token == '-' || token == '*' || token == '/';
  }

  int precedence(String op) {
    switch (op) {
      case '+':
      case '-':
        return 1;
      case '*':
      case '/':
        return 2;
      default:
        return 0;
    }
  }

  double applyOp(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        if (b == 0) {
          throw new Exception("Division by zero");
        }
        return a / b;
      default:
        return 0.0;
    }
  }

  Widget _buildButton(String buttonText,
      { //Color buttonColor = Colors.black,
      Color textColor = Colors.white,
      double fontSize = 24.0}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      // margin: EdgeInsets.only(left: 3.9, bottom: 0),
      height: MediaQuery.of(context).size.height * .10,
      width: MediaQuery.of(context).size.width * .25,
      child: MaterialButton(
        onPressed: () => _buttonPressed(buttonText),
        color: Color.fromARGB(133, 26, 5, 218),
        textColor: textColor,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(133, 26, 5, 218),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Agne',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Let\'s'),
              TypewriterAnimatedText('Calculate...'),
            ],
            onTap: () {
              TypewriterAnimatedText('Molay');
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenlsy,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 102, 101, 99),
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(25),
                    bottomStart: Radius.circular(25)),
              ),
              height: MediaQuery.of(context).size.height * .382,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                child: Text(
                  _input.isEmpty ? 'Calculator' : _input,
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildButton('AC', textColor: Colors.red),
                    _buildButton('+/-'),
                    _buildButton('%'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  //: CrossAxisAlignment.stretch,
                  children: [
                    _buildButton('0'),
                    _buildButton('.'),
                    _buildButton('=',
                        textColor: Color.fromARGB(224, 239, 243, 4)),
                    _buildButton('C',
                        textColor: Color.fromARGB(225, 187, 4, 163)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
