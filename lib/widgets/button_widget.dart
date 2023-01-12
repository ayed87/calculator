import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonWidget extends StatelessWidget {
  Color color;
  String text;
  int? flex;

  Function()? ontap;
  ButtonWidget({required this.color, required this.text, this.flex, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex == null ? 1 : flex!,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: ontap,
          child: Ink(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            // padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                text,
                style: kButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
