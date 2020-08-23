import 'package:vector_math/vector_math.dart' as math3;
import '../MyLibrary/import_file.dart';
//import 'package:dio/dio.dart' as DIO;

class Wall2 extends StatefulWidget
{
  static String route = 'Wall2';

  @override
  _Wall2State createState()
  => _Wall2State();
}

class _Wall2State extends State<Wall2>
{
  final Color _starWarColor = Color.fromRGBO(229, 177, 58, 1.0);
  Size _size;
  int _speed = 200;
  ScrollController _scrollController;
  List<Article> _articleList = [];
  WebSocketChannel _channel;
  Box<Person> _boxPerson = Hive.box<Person>(GlobalPersonBoxLog);
  Person _person;
  int _takeNumber = 0;

  Future<void> _getStreamArticle(int takeNumber)
  async
  {
    const String url = 'http://192.168.1.100:3000/article/all';
//    const String url = 'http://192.168.1.100:3000/articleall';
//    const String url = 'http://192.168.1.100:8888/articleall';
//    const String url = 'http://192.168.1.100:3000';
    _person = _boxPerson.get(0);
    final jsonObj = {
      "userName": _person.userName,
      "passWord": _person.passWord,
      "takeNumber": takeNumber,
    };
    final Client client = Client();
    final Request _request = Request('post', Uri.parse(url));
    _request.headers.addAll({'content-Type': 'application/json', 'charset': 'utf-8'});
    _request.body = jsonEncode(jsonObj);
    final streamedResponse = await client.send(_request);
    streamedResponse.stream.transform(Utf8Decoder())
        .map((event)
    => jsonDecode(event) as Map<String, dynamic>)
        .forEach((element)
    {
      _articleList.add(Article.fromJson(element));
    });
    _articleList.sort((a,b)=> b.writingTimeUTC.compareTo(a.writingTimeUTC));
    setState(() {
      //_jumpToBottom2();

    });

    await Future.delayed(const Duration(seconds: 2));
    client.close();
    //_animateToBottom(_scrollController);
    _jumpToBottom2();
    //client.close();
  }

  void _getArticleWS()
  {
    _channel = IOWebSocketChannel.connect('ws://192.168.1.100:3050',
    pingInterval: const Duration(milliseconds: 31000));
    _channel.stream.listen((data)
    {
      //print(data);
      _articleList.add(Article.fromJson(jsonDecode(data)));
      setState(() {
//        articleList.add(Article.fromJson(jsonDecode(data)));
        _articleList.sort((a,b)=> b.writingTimeUTC.compareTo(a.writingTimeUTC));
        _jumpToBottom2();
      });
//      jumpToBottom2();
//      setState(() {
//      });
    },
    onError: (err)
    {
      print(err);
    },
    onDone: ()
    {
      print('close-client');
    });
    final jsonObj = {
      'userName': 'aaa'
    };
    _channel.sink.add(jsonEncode(jsonObj));
  }

  Future<void> _animateToBottom(ScrollController controller) async
  {
    if (!controller.hasClients || (controller.position.pixels ==
        controller.position.maxScrollExtent))
      return;

    double currentPosition = controller.offset;
    double distance = controller.position.maxScrollExtent - currentPosition;
    double time = (distance /_speed) * 1000;
    await controller.animateTo(controller.position.maxScrollExtent,
      duration: Duration(milliseconds: (time.toInt() == 0 )? 1: time.toInt()),
      curve: Curves.linear,
    );
    _animateToBottom(controller);
  }

  void _jumpToBottom2() {
//    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    double currentPosition = _scrollController.offset;
//    int min = _scrollController.position.minScrollExtent.toInt();
    double distance = _scrollController.position.maxScrollExtent - currentPosition;
    double time = (distance /_speed) * 1000;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: (time.toInt() == 0 )? 1: time.toInt()),
      curve: Curves.linear,
    );
  }

  void _jumpToBottom() {
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
//    _scrollController.jumpTo(_size.height);
    int currentPosition = _scrollController.offset.toInt();
    int distance = _scrollController.position.maxScrollExtent.toInt() - currentPosition;
    int time = distance ~/_speed;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: time),
      curve: Curves.linear,
    );
  }

  void _scrollListener()
  {
    if(_scrollController.offset >= _scrollController.position.maxScrollExtent * 0.8)
    {
      if(_scrollController.offset >= _scrollController.position.maxScrollExtent)
      {
        print('maxScrollExtent');
      }
      else
      {
        print('maxScrollExtent * 0.8');
        _jumpToBottom2();
        //_takeNumber += 100;
        //_getStreamArticle(_takeNumber);
      }
    }
//    if (_scrollController.offset < _scrollController.position.minScrollExtent ||
//        _scrollController.position.outOfRange)
//    {
//      _animateToBottom(_scrollController);
//    }
  }

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _scrollController = ScrollController(keepScrollOffset: true);
    _scrollController.addListener(_scrollListener);
    //_getStreamArticle(_takeNumber);
    //_getArticleWS();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _getStreamArticle(_takeNumber));
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _channel?.sink?.close();
    super.deactivate();
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
            "Wall",
            style: kAppBareStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: FlutterLogo(
                //colors: Colors.indigo,
              ),
              onPressed: ()
              {
                Navigator.pushNamed(context, Menu.route);
                //Navigator.pushReplacementNamed(context, Menu.route);
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
                physics: BouncingScrollPhysics(),
                reverse: false,
                controller: _scrollController,
                itemCount: _articleList.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: _size.height*0.6,),
                      Text(_articleList[index].body,
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
                      ),
                    ],
                  );
                },
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