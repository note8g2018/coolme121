import '../MyLibrary/import_file.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:dio/dio.dart' as DIO;

class Wall2 extends StatefulWidget 
{
  static String route = 'Wall2';
  

  @override
  _Wall2State createState() => _Wall2State();
}

class _Wall2State extends State<Wall2>
{
  static const Color _starWarColor = Color.fromRGBO(229, 177, 58, 1.0);
  Size _size;
  int speed = 50;
  int time;
  int distance;
  ScrollController _scrollController;

  Stream _getStreamArticle() async*
  {
    const String url = 'http://192.168.1.100:8888';
    DIO.RequestOptions option = DIO.RequestOptions();
    //option.responseType = DIO.ResponseType.stream;
    option.baseUrl = url;
    //option.contentType = DIO.Headers.jsonContentType;
    option.method = 'GET';
    //option.data = jsonEncode(article.toJson());
    DIO.Dio dio = DIO.Dio();
    DIO.Response response;
    response = await dio.request("/articleall", options: option);
    print("done");
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) => jumpToBottom());
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
            child: StreamBuilder(
              stream: _getStreamArticle(),
              builder: (context, snapshot) {
                return ListView(
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
                          color: _starWarColor,
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
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}