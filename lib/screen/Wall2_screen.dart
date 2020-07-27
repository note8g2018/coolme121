import 'package:coolme121/model/Article_model.dart';

import '../MyLibrary/import_file.dart';
//import 'package:mongo_dart/mongo_dart.dart' as mongo;
//import 'package:dio/dio.dart' as DIO;

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
  StreamController<Article> _streamController;
  Stream<Article> _stream;
  List<Article> articleList = [];

  void _getStreamArticle() async
  {
    const String url2 = 'http://192.168.1.100:8888/articleall';
    const String url3 = 'http://192.168.1.100:3000/articleall';
    const String url = 'http://192.168.1.100:8888/articleall';
    const String url4 = 'http://192.168.1.100:3000';

    // or get documents as they are recieved
    final client = Client();
    final streamedResponse = await client.send(Request('get', Uri.parse(url2)));
    streamedResponse.stream.asBroadcastStream();
    streamedResponse.stream.transform(Utf8Decoder())
    .map((event) => jsonDecode(event) as Map<String, dynamic>)
    .forEach((element) {
      Article mArticle = Article.fromJson(element);
      _streamController.add(mArticle);
      articleList.add(mArticle);
    });
    _stream.forEach((element) {print(element.body);});

//    final jsonStream = const Utf8Decoder()
//        .bind(streamedResponse.stream)
//        .map((str) => json.decode(str) as Map<String, dynamic>);
//    await jsonStream.forEach((json) {
//      assert(json is Map<String, dynamic>);
//      articleList.add(Article.fromJson(json));
//      print(json);
//    });
//
//    client.close();
  }

  @override
  void initState() {
    //WidgetsFlutterBinding.ensureInitialized();
   // _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
    _streamController = StreamController<Article>();
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