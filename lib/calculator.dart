import 'package:calculator/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double firstnumber = 0.0;
  double secondnumber = 0.0;
  var input = '';
  var output = '';
  var operarion = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    if (value == "C") {
      input = '';
      output = '';
    } 
    else if (value == "+/-") {
      input.toString().startsWith("-")
          ? input = input.toString().substring(1)
          : input = "-" + input.toString();
      output.toString().startsWith("-") ? output = output.toString().substring(1)
          : output = "-" + output.toString();
    }
    else if (value == "=") {
      if (input.isNotEmpty) {
        // if(input.contains("%")){
        //   var userInput = input;
        //   userInput = input.replaceAll("%","*");
        //   Parser p = Parser();
        //   Expression expression = p.parse(userInput);
        // ContextModel cm = ContextModel();
        // var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        // finalValue = finalValue/100;
        // output = finalValue.toString();
        // }
        // else{
        var userInput = input;
        userInput = input.replaceAll("×", "*");
        // userInput = input.replaceAll("÷", "/");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        // }
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 48.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {});
  }

  backspace() {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? secondaryColor : primaryColor,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(hideInput ? "" : input,
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 48)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(output,
                        style: TextStyle(
                            color: isDarkMode
                                ? Color.fromARGB(255, 195, 195, 195)
                                : Color(0xff575757),
                            fontSize: outputSize)),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: isDarkMode ? buttonColorDark : buttonColorLight,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      button(text: "C"),
                      button(text: "+/-"),
                      outlined(),
                      operator(text: "/"),
                    ],
                  ),
                  Row(
                    children: [
                      button(text: "7"),
                      button(text: "8"),
                      button(text: "9"),
                      operator(text: "×")
                    ],
                  ),
                  Row(
                    children: [
                      button(text: "4"),
                      button(text: "5"),
                      button(text: "6"),
                      operator(text: "-")
                    ],
                  ),
                  Row(
                    children: [
                      button(text: "1"),
                      button(text: "2"),
                      button(text: "3"),
                      operator(text: "+")
                    ],
                  ),
                  Row(
                    children: [
                      button(text: "00"),
                      button(text: "0"),
                      button(text: "."),
                      operator(text: "=")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button({text}) {
    return Expanded(
        child: TextButton(
      onPressed: () => onButtonClick(text),
      style: TextButton.styleFrom(shape: const CircleBorder()),
      child: Text(
        text,
        style: const TextStyle(fontSize: 26),
      ),
    ));
  }

  Widget operator({text}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onButtonClick(text),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(13),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }

  Widget outlined() {
    return Expanded(
        child: OutlinedButton(
      onPressed: () => backspace(),
      style: TextButton.styleFrom(shape: const CircleBorder()),
      child: const Icon(
        Icons.backspace_outlined,
        size: 26,
      ),
    ));
  }
}
