import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TwoText extends StatelessWidget {
  String firstText;
  String secondText;
  double fontSize;
  MainAxisAlignment mainAxisAlignment;
  TwoText({Key? key, required this.firstText,this.fontSize = 16, required this.secondText, this.mainAxisAlignment = MainAxisAlignment.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          '$firstText ',
          style: GoogleFonts.elMessiri(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        Flexible(
          child: Text(
            secondText,
            style: GoogleFonts.elMessiri(
              fontSize: fontSize + 2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
