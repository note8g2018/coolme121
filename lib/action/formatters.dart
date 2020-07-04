import 'package:flutter/services.dart';

class UserNameFormatter extends TextInputFormatter
{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue)
  {
    // TODO: implement formatEditUpdate
//    const String pattern = r'^([a-z]{3})([a-z0-9]{5,28}$)';
//    final RegExp regex = RegExp(pattern);
    const String pattern = r'^([a-z])';
    final RegExp regex = RegExp(pattern);
    if(newValue.text.length < 4)
    {
      if(regex.hasMatch(newValue.text))
        {
          return TextEditingValue(
            text: newValue.text,
            selection: TextSelection.collapsed(offset: newValue.selection.end),
          );
        }
      else
        {
          return TextEditingValue(
            text: oldValue.text,
            selection: TextSelection.collapsed(offset: oldValue.selection.start),
          );
        }
    }
  }

}