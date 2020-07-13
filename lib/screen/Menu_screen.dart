import 'dart:ui';
import 'package:coolme121/screen/Wall_screen.dart';

import '../screen/WritingArticle_screen.dart';
import '../screen/Register_screen.dart';
import 'package:flutter/services.dart';
import '../constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/LinkBall_widget.dart';

class Menu extends StatelessWidget
{
  static const String route = 'Menu';

  @override
  Widget build(BuildContext context)
  {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      //resizeToAvoidBottomInset: true,
      //resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Menu",
          style: kAppBareStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
              child: GestureDetector(
                onTap: (){
                  print("me");
                },
                child: ClipOval(
                    child: Image.asset("images/image18.jpg",
                      //width: 100.0,
                      height: 200.0,
                    ),
                ),
              ),
                ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.start,
                  spacing: 15.0,
                  runSpacing: 15.0,
                  children: <Widget>[
                    LinkBall(
                      title: "Write Article",
                      onTap: (){
                        Navigator.pushNamed(context, WritingArticle.route);
                      },
                    ),
                    LinkBall(
                      title: "Wall",
                      onTap: (){
                        Navigator.pushNamed(context, Wall.route);
                      },
                    ),
                    LinkBall(
                      title: "My Friends",
                      onTap: (){},
                    ),
                    LinkBall(
                      title: "Add Friend",
                      onTap: (){},
                    ),
                    LinkBall(
                      title: "Log Out",
                      onTap: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


