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
  String opText = '0';
  double result = 0.0;

  List<TextSpan> retrunTextSpan(String text) {
    List<TextSpan> textList = [];
    for (int i = 0; i < text.length; i++) {
      if (text[i] == '%') {
        textList.add(const TextSpan(text: "%", style: kRichTextStyle1));
      } else if (text[i] == '*') {
        textList.add(const TextSpan(text: "×", style: kRichTextStyle1));
      } else if (text[i] == '-') {
        textList.add(const TextSpan(text: "-", style: kRichTextStyle1));
      } else if (text[i] == '+') {
        textList.add(const TextSpan(text: "+", style: kRichTextStyle1));
      } else if (text[i] == '/') {
        textList.add(const TextSpan(text: "/", style: kRichTextStyle1));
      } else {
        textList.add(TextSpan(text: text[i], style: kRichTextStyle2));
      }
    }
    return textList;
  }

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
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '=',
                            style: kEqualTextStyle,
                            // textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            result.toString(),
                            maxLines: 1,
                            style: kResultTextStyle,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      color: kColorTwo,
                    ),
                  ),

                  // i might use richText widget see the docs : https://api.flutter.dev/flutter/widgets/RichText-class.html
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: RichText(
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: true,
                        applyHeightToLastDescent: true,
                      ),
                      text: TextSpan(children: retrunTextSpan(opText)),
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
                                opText = '0';
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
                                if (opText != "0" &&
                                    !opText.isEmpty &&
                                    opText.length != 1) {
                                  opText =
                                      opText.substring(0, opText.length - 1);
                                } else {
                                  opText = '0';
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
                                  opText = eval.toString();
                                } catch (exption) {
                                  print(exption);
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
      ),
    );
  }
}
