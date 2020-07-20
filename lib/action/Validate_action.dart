//import 'package:email_validator/email_validator.dart';
import '../MyLibrary/import_file.dart';

class ValidateDate
{
  static bool userName(String username)
  {
    const String pattern = r'^([a-z]{3})([a-z0-9]{5,28}$)';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(username))
    {
      return false;
    }
    else
      return true;
  }

  static bool passWord1(String passWord1)
  {
    const String pattern = r'^([a-zA-Z0-9!@#$%^&*()_+=-]{8,31}$)';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(passWord1))
      return false;
    else
      return true;
  }

  static bool passWord2(String passWord1, String passWord2)
  {
    if (passWord1 != passWord2)
      return false;
    else
      return true;
  }

  static bool email(String email)
  {
    return EmailValidator.validate(email);
  }

}

//  static String passWordV2(String passWord1, String passWord2) {
//    if (passWord1 != passWord2)
//      return 'Password does not match';
//    else
//      return null;
//  }
