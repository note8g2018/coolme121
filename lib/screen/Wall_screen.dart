//import '../screen/Menu_screen.dart';
//import 'package:vector_math/vector_math.dart' as math3;
//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import '../constant/textStyle.dart';

import '../MyLibrary/import_file.dart';
import 'package:vector_math/vector_math.dart' as math3;

class Wall extends StatefulWidget {
  static String route = 'Wall';
  static const Color _starWarColor = Color.fromRGBO(229, 177, 58, 1.0);

  @override
  _WallState createState() => _WallState();
}

class _WallState extends State<Wall>
{
  Size _size;
  int speed = 50;
  int time;
  int distance;
  ScrollController _scrollController;

  void jumpToBottom2() {
//    _scrollController.jumpTo(_size.height);

    int currentPosition = _scrollController.offset.toInt();
    int distance = _scrollController.position.maxScrollExtent.toInt()
        - currentPosition;
    time = distance ~/speed;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: time),
      curve: Curves.linear,
    );
  }

  void jumpToBottom() {
//    _scrollController.jumpTo(_size.height);

    int currentPosition = _scrollController.offset.toInt();
    int distance = _scrollController.position.maxScrollExtent.toInt()
        - currentPosition;
    time = distance ~/speed;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: time),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => jumpToBottom());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        //resizeToAvoidBottomPadding: true,
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Wall",
            style: kAppBareStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: FlutterLogo(
                //colors: Colors.indigo,
              ),
              onPressed: (){
                Navigator.pushNamed(context, Menu.route);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image11.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.00107)
                ..rotateX(math3.radians(-45))
                ..scale(1.0, 1.5),
              child: ListView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: _size.height,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "its me, Are YOU loooooooooooooool what the nice. "
                          "how are you man. time to dance Baby. can we go to the moon. "
                          "really.,:; We must respect semicolon. Fuck JS and Python. "
                          "Fuck microsoft, apple :) are you still watching me Baby. "
                          "Master Yoda, Lord Veder, Luck, Baby Yoda and me only. ",
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Wall._starWarColor,
                        fontFamily: "SWCrawlBody",
                        letterSpacing: 3.0,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            //offset: Offset(5.0, 1.0),
                            offset: Offset(5.0, 10.0),
                          ),
                        ],
                      ),
                      children: [
                        TextSpan(
                          text:
                              "its me, Are YOU loooooooooooooool what the nice. "
                              "how are you man. time to dance Baby. can we go to the moon. "
                              "really.,:; We must respect semicolon. Fuck JS and Python. "
                              "Fuck microsoft, apple :) are you still watching me Baby. "
                              "Master Yoda, Lord Veder, Luck, Baby Yoda and me only. ",
                          style: TextStyle(
                            fontSize: 60.0,
                            //color: Colors.lime,
                            //fontFamily: "Starjedi",
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _size.height,
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
