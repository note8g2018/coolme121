import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/textStyle.dart';
import 'package:flutter/services.dart';

final Widget kUserNameContainer = Container(
  color: Colors.black,
  margin: EdgeInsets.all(20.0),
  padding: EdgeInsets.all(20.0),
  child: ListView(
    padding: EdgeInsets.only(top: 15.0,),
    shrinkWrap: true,
    //crossAxisAlignment: CrossAxisAlignment.start,
    //mainAxisAlignment: MainAxisAlignment.start,
    //mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      TextFormField(
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp('[0-9a-z]')),
          LengthLimitingTextInputFormatter(28),
        ],
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
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1.\t", style: kRoleStyle,),
          Expanded(
            flex: 1,
            child: Text("At least 8 characters [8, 28]",
              style: kRoleStyle,),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2.\t", style: kRoleStyle,),
          Expanded(
            flex: 1,
            child: Text("The first three must be from [a, z]",
              style: kRoleStyle,),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3.\t", style: kRoleStyle,),
          Expanded(
            flex: 1,
            child: Text("The rest must be from [a, z] or [0, 9]",
              style: kRoleStyle,),
          ),
        ],
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.green,
              //elevation: 5.0,
              onPressed: (){

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Next",
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowAltCircleRight,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);

final Widget kEmailContainer = Container(
  color: Colors.black,
  margin: EdgeInsets.all(20.0),
  padding: EdgeInsets.all(20.0),
  child: ListView(
    padding: EdgeInsets.only(top: 15.0,),
    //physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    //crossAxisAlignment: CrossAxisAlignment.start,
    //mainAxisAlignment: MainAxisAlignment.start,
    //mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      TextFormField(
        //focusNode: FocusNode(),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.openSans(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
        decoration: InputDecoration(
          labelText: "Email",
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
      Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.red,
              //elevation: 5.0,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.arrowAltCircleLeft,
                    size: 40.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Back",
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.green,
              //elevation: 5.0,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Next",
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowAltCircleRight,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);

final Widget kPassword1Container = Container(
  color: Colors.black,
  margin: EdgeInsets.all(20.0),
  padding: EdgeInsets.all(20.0),
  child: ListView(
    padding: EdgeInsets.only(top: 15.0,),
    shrinkWrap: true,
    children: <Widget>[
      TextFormField(
        obscureText: true,
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp('[a-zA-Z0-9!@#\$%^&*()_+=-]')),
          LengthLimitingTextInputFormatter(31),
        ],
        keyboardType: TextInputType.visiblePassword,
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
        height: 15.0,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1.\t", style: kRoleStyle,),
          Expanded(
            flex: 1,
            child: Text("At least 8 characters [ 8, 31 ]",
              style: kRoleStyle,),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2.\t", style: kRoleStyle,),
          Expanded(
            flex: 1,
            child: Text("Must be from [ a, z ] or [ A, Z ] or [ 0, 9 ] or "
                + "[ ! @ # \$ % ^ & * ( ) _ + = - ]",
              style: kRoleStyle,),
          ),
        ],
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.red,
              //elevation: 5.0,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.arrowAltCircleLeft,
                    size: 40.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Back",
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.green,
              //elevation: 5.0,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Next",
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowAltCircleRight,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);

final Widget kPassword2Container = Container(
  color: Colors.black,
  margin: EdgeInsets.all(20.0),
  padding: EdgeInsets.all(20.0),
  child: ListView(
    padding: EdgeInsets.only(top: 15.0,),
    shrinkWrap: true,
    children: <Widget>[
      TextFormField(
        obscureText: true,
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp('[a-zA-Z0-9!@#\$%^&*()_+=-]')),
          LengthLimitingTextInputFormatter(31),
        ],
        keyboardType: TextInputType.visiblePassword,
        style: GoogleFonts.openSans(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
        decoration: InputDecoration(
          labelText: "Repeat Password",
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
      Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.red,
              //elevation: 5.0,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.arrowAltCircleLeft,
                    size: 40.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Back",
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(15.0),
              color: Colors.green,
              //elevation: 5.0,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Register",
                    style: GoogleFonts.pangolin(
                      fontSize: 35.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);