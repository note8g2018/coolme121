import 'package:flutter/material.dart';

class TextM1 extends StatelessWidget
{
  TextM1({
    this.data,
});

  final String data;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),

      child: Text(
        data,
        style: TextStyle(
          fontFamily: 'Open Sans Condensed Bold',
        ),
      ),
    );

  }
}
