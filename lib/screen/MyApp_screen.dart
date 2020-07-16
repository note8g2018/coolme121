import '../screen/WritingArticle_screen.dart';
import 'package:flutter/material.dart';
import '../screen/LogIn_screen.dart';
import 'package:flutter/services.dart';
import '../screen/Menu_screen.dart';
import '../screen/Register_screen.dart';
import '../screen/Wall_screen.dart';
import '../screen/AddFriend_screen.dart';
import '../screen/MyFriends_screen.dart';


class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.green,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.green,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),

        title: 'CoolME',
        initialRoute: Register.route,
        routes:
        {
          LogIn.route: (context) => LogIn(),
          Register.route: (context) => Register(),
          WritingArticle.route: (context) => WritingArticle(),
          Wall.route: (context) => Wall(),
          Menu.route: (context) => Menu(),
          AddFriend.route: (context) => AddFriend(),
          MyFriends.route: (context) => MyFriends(),
        },
      ),
    );
  }
}
