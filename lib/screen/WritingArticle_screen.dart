import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/textStyle.dart';
import '../screen/Menu_screen.dart';

class WritingArticle extends StatelessWidget
{
  static String route = 'WritingArticle';

  @override
  Widget build(BuildContext context) {
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
          title: Text("Writing Article",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  //textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.openSans(
                    fontSize: 25.0,
                    color: Colors.lightBlue,
                  ),
                  decoration: InputDecoration(
                    labelText: "Title",
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
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 0.0,
                  ),
                  child: TextFormField(
                    scrollPadding: EdgeInsets.zero,
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    minLines: null,
                    maxLengthEnforced: true,
                    expands: true,
                    style: GoogleFonts.openSans(
                      fontSize: 25.0,
                      color: Colors.purpleAccent,
                    ),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: "The Article",
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
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: FlatButton(
                  onPressed: (){},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(0.0),
                  color: Colors.green,
                  child: Text(
                    "Send",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pangolin(
                      fontSize: 25.0,
                      //height: 2.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
