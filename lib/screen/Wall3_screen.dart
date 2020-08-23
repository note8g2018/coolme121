import 'package:vector_math/vector_math.dart' as math3;
import 'package:web_socket_channel/status.dart' as status;
import '../MyLibrary/import_file.dart';
import 'package:dio/dio.dart' as DIO;

class Wall3 extends StatefulWidget
{
  static String route = 'Wall3';
  Article article;
  Wall3({Key key, this.article}): super(key: key);
  //print(article.title);

  @override
  _Wall3State createState()
  => _Wall3State();
}

class _Wall3State extends State<Wall3>
{
  final Color _starWarColor = Color.fromRGBO(229, 177, 58, 1.0);
  Size _size;
  double _speed = 300.0;
  ScrollController _scrollController;
  List<Article> _articleList = [];
  IOWebSocketChannel _channel;
  Box<Person> _boxPerson = Hive.box<Person>(GlobalPersonBoxLog);
  Person _person;
  int _limitNumber = 5;
  //Article _article2 = widget.article;
  

  Future<void> _getArticleWS() async
  {
    _person = _boxPerson.get(0);
    final jsonObj = {
      "userName": _person.userName,
      "passWord": _person.passWord,
    };
 //   await _channel?.sink?.close(status.goingAway);    
    _channel = IOWebSocketChannel.connect('ws://192.168.1.100:3050/sockserver/websocket',
        pingInterval: const Duration(milliseconds: 31000));
    _channel.sink.add(jsonEncode(jsonObj));    
    _channel.stream.listen((data)
    {
      print('data');
      _articleList.add(Article.fromJson(jsonDecode(data)));
      _articleList.sort((a, b)=> b.writingTimeUTC.compareTo(a.writingTimeUTC));
      setState((){});
    },
    onError: (err)
    {
      print(err);
    },
    onDone: () async
    {
      print('close-client');
      await _channel?.sink?.close(status.goingAway);
      //_channel = IOWebSocketChannel.connect('ws://192.168.1.100:3050',
      //    pingInterval: const Duration(milliseconds: 31000));
      //_channel.sink.add(jsonEncode(jsonObj));
    });
  }

  void _jumpToBottom()
  {
    double distance =
        _scrollController.position.maxScrollExtent - _scrollController.offset;
    double distance2 = _scrollController.position.maxScrollExtent;
    double time = (distance / _speed);
    int time2 = time.toInt();
    //print('offset: ' + _scrollController.offset.toString());
    //print('pixels: ' + _scrollController.position.pixels.toString());
    //print('maxScrollExtent: ' + _scrollController.position.maxScrollExtent.toString());
    //setState(() {});
    //_scrollController.addListener(_scrollListener);
    double ddd = _scrollController.position.maxScrollExtent + 200.0;
    _scrollController.animateTo(
      ddd,
      duration: Duration(seconds: (time2 == 0) ? 1 : time2),
      curve: Curves.linear,
    );
    //_scrollController.addListener(_scrollListener);
  }

  Future<void> _getStreamArticle()
  async {
    const String url = 'http://192.168.1.100:3000/article/all';
//    const String url = 'http://192.168.1.100:3000/articleall';
//    const String url = 'http://192.168.1.100:8888/articleall';
//    const String url = 'http://192.168.1.100:3000';
    String time;
    if (_articleList.isEmpty)
    {
      time = DateTime.now().toUtc().toIso8601String();
    }
    else
    {
      time = _articleList.last.writingTimeUTC.toIso8601String();
    }
    _person = _boxPerson.get(0);
    final jsonObj = {
      "userName": _person.userName,
      "passWord": _person.passWord,
      "limitNumber": _limitNumber,
      "time": time,
    };
    final Client client = Client();
    final Request _request = Request('post', Uri.parse(url));
    _request.headers
        .addAll({'content-Type': 'application/json', 'charset': 'utf-8'});
    _request.body = jsonEncode(jsonObj);
    final streamedResponse = await client.send(_request);

//    final ss1 = streamedResponse.stream.asBroadcastStream();
//    if(await ss1.isEmpty)
//      {
//        print('null');
//        //_jumpToBottom2();
//        return;
//      }
    streamedResponse.stream
        .transform(Utf8Decoder())
        .map((event)
    => jsonDecode(event) as Map<String, dynamic>)
        .forEach((element)
    {
      print(element);
      if (element.isEmpty)
      {
        //_jumpToBottom();
        return;
      }
      _articleList.add(Article.fromJson(element));
    });
    client.close();
    _articleList.sort((a, b)
    => b.writingTimeUTC.compareTo(a.writingTimeUTC));
    setState(()
    {});
  }

  Future<void> _getStreamArticle2()
  async {
    Article aa = widget.article;
    _articleList.add(aa);
//    const String url = 'http://192.168.1.100:3000/article/all';
//    const String url = 'http://192.168.1.100:3000/articleall';
//    const String url = 'http://192.168.1.100:8888/articleall';
    const String url = 'http://192.168.1.100:3000';
    String time;
    if (_articleList.isEmpty)
    {
      time = DateTime.now().toUtc().toIso8601String();
    }
    else
    {
      time = _articleList.last.writingTimeUTC.toIso8601String();
    }
    _person = _boxPerson.get(0);
    final jsonObj = {
      "userName": _person.userName,
      "passWord": _person.passWord,
      "limitNumber": _limitNumber,
      "time": time,
    };
    DIO.RequestOptions option = DIO.RequestOptions();
    option.responseType = DIO.ResponseType.json;
//    option.connectTimeout = 5000;
    option.baseUrl = url;
    option.contentType = DIO.Headers.jsonContentType;
    option.method = 'POST';
    option.data = jsonObj;
    DIO.Dio dio = DIO.Dio();
    DIO.Response response;
    response = await dio.request("/article/all", options: option);
    final List<dynamic> data = jsonDecode(response.data);
    if (data.isEmpty)
    {
      print('null');
      return;
    }
    data.forEach((element)
    {
      Article article = Article.fromJson(element);
      setState(()
      {
        _articleList.add(article);
      });
    });
  }

  void _scrollListener()
  async {
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent)
    {
      //_scrollController.removeListener(_scrollListener);
      print('maxScrollExtent');
      _getStreamArticle2();
    }
//    if (_scrollController.offset < _scrollController.position.minScrollExtent ||
//        _scrollController.position.outOfRange)
//    {
//      _animateToBottom(_scrollController);
//    }
  }

  Widget _getWidget()
  {
    //final List<Widget> widgetList = List<Widget>();
    _articleList.forEach((article)
    {
      //widgetList.add(
      return ArticleWidget(article: article);
      //);
    });
    //return widgetList;
  }

  Future<void> myInitState() async
  {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _getArticleWS();
    //await Future.delayed(const Duration(milliseconds: 3000));
  }

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    //WidgetsFlutterBinding.ensureInitialized();
    myInitState();
  
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async
    {
      //await Future.delayed(const Duration(milliseconds: 1900));
      _getStreamArticle2();
    });
  }

  @override
  void dispose()
  {
    // TODO: implement dispose
    _scrollController.dispose();
    _channel?.sink?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    WidgetsBinding.instance.addPostFrameCallback((_)
    => _jumpToBottom());

    _size = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: ()
      {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus)
        {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        //resizeToAvoidBottomPadding: true,
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Wall 3",
            style: kAppBareStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: FlutterLogo(
                //colors: Colors.indigo,
              ),
              onPressed: ()
              async {
                await _channel?.sink?.close(status.goingAway);
                //Navigator.pushNamed(context, Menu.route);
                Navigator.pushReplacementNamed(context, Menu.route);
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
              child: ListView.builder(
                shrinkWrap: true,
                //physics: BouncingScrollPhysics(),
                reverse: false,
                controller: _scrollController,
                itemCount: _articleList.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return ArticleWidget(article: _articleList[index]);
                },
//                itemBuilder: (BuildContext context, int index)
//                {
//                  return Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      SizedBox(height: _size.height * 0.6,),
//                      Text(_articleList[index].body,
//                        style: TextStyle(
//                          fontSize: 60.0,
//                          fontWeight: FontWeight.bold,
//                          color: _starWarColor,
//                          fontFamily: "SWCrawlBody",
//                          letterSpacing: 3.0,
//                          shadows: [
//                            Shadow(
//                              color: Colors.black,
//                              blurRadius: 2.0,
//                              //offset: Offset(5.0, 1.0),
//                              offset: Offset(5.0, 10.0),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  );
//                },
//                separatorBuilder: (BuildContext context, int index)
//                {
//                  return SizedBox(height: _size.height * 0.5);
//                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
