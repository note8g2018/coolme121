import 'package:flutter/material.dart';

class TextFormM1 extends StatelessWidget
{
  TextFormM1({
    this.obscureText = false,
    @required this.keyboardType,
    @required this.letterSpacing,
    @required this.color,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.labelText,
    this.onChanged,
  });

  final bool obscureText;
  final TextInputType keyboardType;
  final double letterSpacing;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String labelText;
  final Function onChanged;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          letterSpacing: letterSpacing,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
