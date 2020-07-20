//import 'package:coolme121/main.dart';
//import '../model/Person_model.dart';
//import '../screen/Register_screen.dart';
//import 'package:flutter/services.dart';
//import '../constant/textStyle.dart';
//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import '../model/TravelMessage_model.dart';
//import '../screen/Wall_screen.dart';
//import '../controller/Login_controller.dart';
//import 'package:hive/hive.dart';

import '../MyLibrary/import_file.dart';

class LogIn extends StatefulWidget
{
  static String route = 'LogIn';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String _userName;
  String _passWord;

  Box<Person> _boxPerson = Hive.box<Person>(GlobalPersonBoxLog);

  void _showSnackBar(String text, BuildContext context)
  {
    final SnackBar mySnackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 0, 0, 1.0),
      duration: Duration(seconds: 10,),
      elevation: 7.0,
    );

    Scaffold.of(context).showSnackBar(mySnackBar);
  }

  Future<bool> _login(BuildContext context) async
  {
    final Map<String, dynamic> jsonOdj = {
      "userName": _userName,
      "passWord": _passWord,
    };
    TravelMessage travelMessage = await LoginController.login(jsonObj: jsonOdj);
    if(!travelMessage.result)
    {
      _showSnackBar(travelMessage.description, context);
      return false;
    }else
    {
      Person personAccount = await LoginController.loginPerson(jsonObj: jsonOdj);
      _boxPerson.put(0, personAccount);
      Navigator.pushNamed(context, Wall.route);
    }
  }

  void _checkLogin(BuildContext context)
  {
    final Person person = _boxPerson.get(0);
    if(person != null)
      {
        if(person.isLogin)
          {
            Navigator.pushNamed(context, Wall.route);
          }
      }
  }

  @override
  void initState() {
    //_checkLogin();
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _checkLogin(context));
  }

  @override
  void dispose() async
  {
    await _boxPerson.compact();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    //_checkLogin(context);
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
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (String value){
                        _userName = value;
                      },
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
                      onChanged: (String value){
                        _passWord = value;
                      },
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
                            onPressed: (){
                              _login(context);
                            },
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
      ),
    );
  }
}
