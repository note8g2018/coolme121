import 'dart:async';

import 'package:coolme121/model/Article_model.dart';

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
  final Color _starWarColor = Color.fromRGBO(229, 177, 58, 1.0);
  Size _size;
  int speed = 50;
  int time;
  int distance;
  //ScrollController _scrollController;
  StreamController _streamController;
  Stream _stream;

  void _getStreamArticle() async
  {
    const String url = 'http://192.168.1.100:8888';
//    DIO.RequestOptions option = DIO.RequestOptions();
//    option.responseType = DIO.ResponseType.stream;
//    option.baseUrl = url;
////    option.contentType = DIO.Headers.jsonContentType;
//    option.method = 'GET';
//    //option.data = jsonEncode(article.toJson());
//    DIO.Dio dio = DIO.Dio();
//    DIO.Response response;
//    response = await dio.request("/articleall", options: option);
    String url2 = 'http://192.168.1.100:8888/articleall';
    Response response = await get(url2);
    _streamController.add(jsonDecode(response.body));
    _stream.listen((event) {
      print(event);
    },
      onDone: (){
      print("Done");
      }
    );

  }

  @override
  void initState() {
    //WidgetsFlutterBinding.ensureInitialized();
   // _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
    _getStreamArticle();
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) => jumpToBottom());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_scrollController.dispose();
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
            child: Container(),
          ),
        ),
      ),
    );
  }
}