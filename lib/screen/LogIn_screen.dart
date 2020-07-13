import '../screen/Register_screen.dart';
import 'package:flutter/services.dart';
import '../constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatelessWidget
{
  static String route = 'LogIn';

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("LogIn",
            style: kAppBareStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.openSans(
                      fontSize: 25.0,
                      color: Colors.purpleAccent,
                    ),
                    decoration: InputDecoration(
                      labelText: "User Name",
                      labelStyle: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 25.0,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.orange, width: 0.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.openSans(
                      fontSize: 25.0,
                      color: Colors.purpleAccent,
                    ),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 25.0,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.orange, width: 0.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          color: Colors.green,
                          elevation: 5.0,
                          onPressed: (){},
                          child: Text(
                            "LogIn",
                            style: GoogleFonts.pangolin(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: FlatButton(
                          //color: Colors.grey[500],
                          padding: EdgeInsets.all(15.0),
                          onPressed: (){
                            Navigator.pushNamed(context, Register.route);
                          },
                          child: Text(
                              "Register",
                            style: GoogleFonts.pangolin(
                              fontSize: 25.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
