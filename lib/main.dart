import 'dart:math';

import 'package:claculator/constants.dart';
import 'package:claculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String opText = '';
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'a claculator',
        theme: ThemeData(
          cardColor: mainColor,
          scaffoldBackgroundColor: mainColor,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              child: Text(
                                '=',
                                style: kEqualTextStyle,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              result.toString(),
                              maxLines: 1,
                              style: kResultTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: kColorTwo,
                      ),
                    ),
                    // i might use richText widget see the docs : https://api.flutter.dev/flutter/widgets/RichText-class.html
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        opText,
                        style: kOperationTextStyle,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      //in the main while we will use 4 columns
                      Expanded(
                        child: Column(
                          children: [
                            ButtonWidget(
                              color: kColorOne,
                              text: 'CE',
                              ontap: (() {
                                setState(() {
                                  opText = '';
                                  result = 0;
                                });
                              }),
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '7',
                              ontap: () {
                                setState(() {
                                  opText = opText + '7';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '4',
                              ontap: () {
                                setState(() {
                                  opText = opText + '4';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '1',
                              ontap: () {
                                setState(() {
                                  opText = opText + '1';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '0',
                              ontap: () {
                                setState(() {
                                  opText = opText + '0';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ButtonWidget(
                              color: kColorOne,
                              text: 'del',
                              ontap: () {
                                setState(() {
                                  if (!opText.isEmpty) {
                                    opText =
                                        opText.substring(0, opText.length - 1);
                                  }
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '8',
                              ontap: () {
                                setState(() {
                                  opText = opText + '8';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '5',
                              ontap: () {
                                setState(() {
                                  opText = opText + '5';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '2',
                              ontap: () {
                                setState(() {
                                  opText = opText + '2';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '.',
                              ontap: () {
                                setState(() {
                                  opText = opText + '.';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ButtonWidget(
                              color: kColorOne,
                              text: '%',
                              ontap: () {
                                setState(() {
                                  opText = opText + '%';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '9',
                              ontap: () {
                                setState(() {
                                  opText = opText + '9';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '6',
                              ontap: () {
                                setState(() {
                                  opText = opText + '6';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorTwo,
                              text: '3',
                              ontap: () {
                                setState(() {
                                  opText = opText + '3';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorOne,
                              text: '=',
                              ontap: () {
                                setState(() {
                                  Parser p = Parser();
                                  try {
                                    Expression? exp = p.parse(opText);
                                    ContextModel cm = ContextModel();
                                    double eval =
                                        exp.evaluate(EvaluationType.REAL, cm);
                                    result = eval;
                                    opText = '';
                                  } catch (exption) {
                                    print(e);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ButtonWidget(
                              color: kColorOne,
                              text: '/',
                              ontap: () {
                                setState(() {
                                  opText = opText + '/';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorOne,
                              text: '*',
                              ontap: () {
                                setState(() {
                                  opText = opText + '*';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorOne,
                              text: '-',
                              ontap: () {
                                setState(() {
                                  opText = opText + '-';
                                });
                              },
                            ),
                            ButtonWidget(
                              color: kColorOne,
                              text: '+',
                              flex: 2,
                              ontap: () {
                                setState(() {
                                  opText = opText + '+';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
