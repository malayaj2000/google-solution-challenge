import 'package:flutter/material.dart';

Widget appBar(BuildContext context, String label) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        fontSize: 22,
      ),
      children: <TextSpan>[
        TextSpan(
          text: label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget blueButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    width: buttonWidth !=null ? buttonWidth : MediaQuery.of(context).size.width - 48.0,
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
  );
}
