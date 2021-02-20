import 'package:flutter/material.dart';
import './widgets/calcButton.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalcApp());
}
class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}




class CalcAppState extends State<CalcApp> {

  String _history = '';
  String _expression = '';

  void numClick(String text){
   setState(() {
     _expression += text;
   });
  }
  void allClear(String text){
    setState(() {
      _history = '';
      _expression = '';
    });
  }
  void clear(String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text){

    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body : Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: TextStyle(fontSize: 28.0,color: Colors.lightBlueAccent.withOpacity(0.8)),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: TextStyle(fontSize: 50.0,color: Colors.greenAccent.withOpacity(0.8)),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    callback: allClear,
                    fillColor: 0xFFA5D6A7,
                  ),CalcButton(
                    text: 'C',
                    callback: clear,
                    fillColor: 0xFFA5D6A7,
                  ),CalcButton(
                    text: '%',
                    callback: numClick,
                    fillColor: 0xFF00E676,
                  ),CalcButton(
                    text: '/',
                    callback: numClick,
                      fillColor: 0xFF00E676,
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                  ),CalcButton(
                    text: '8',
                    callback: numClick,
                  ),CalcButton(
                    text: '9',
                    callback: numClick,
                  ),CalcButton(
                    text: '*',
                    callback: numClick,
                      fillColor: 0xFF00E676,
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                  ),CalcButton(
                    text: '5',
                    callback: numClick,
                  ),CalcButton(
                    text: '6',
                    callback: numClick,
                  ),CalcButton(
                    text: '-',
                    callback: numClick,
                      fillColor: 0xFF00E676,
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick,
                  ),CalcButton(
                    text: '2',
                    callback: numClick,
                  ),CalcButton(
                    text: '3',
                    callback: numClick,
                  ),CalcButton(
                    text: '+',
                    callback: numClick,
                    fillColor: 0xFF00E676,
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: numClick,
                  ),CalcButton(
                    text: '0',
                    callback: numClick,
                  ),CalcButton(
                    text: '00',
                    callback: numClick,
                  ),CalcButton(
                    text: '=',
                    callback: evaluate,
                    fillColor: 0xFF00E676,
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
