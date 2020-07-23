

class Article
{
  String title;
  String body;
  String author;
  DateTime writingTimeUTC;
  bool isPublic;
  
  Article({
    this.title,
    this.body,
    this.author,
    this.writingTimeUTC,
    this.isPublic,
});

  factory Article.fromJson(dynamic jsonObj)
  {
 //   DateTime _dateTime = DateTime;
//    if(jsonObj["writeTimeUTC"] == null)
//      {
//        _dateTime = null;
//      }
//    else
//      {
//        _dateTime = DateTime.fromMillisecondsSinceEpoch(jsonObj["writeTimeUTC"] as int).toUtc();
//      }
    return Article(
      title: jsonObj["title"] as String,
      body: jsonObj["body"] as String,
      author: jsonObj["author"] as String,
      //writeTimeUTC: jsonObj["writeTimeUTC"] as DateTime,
      isPublic: jsonObj["isPublic"] as bool,
//      writingTimeUTC: DateTime
//          .fromMillisecondsSinceEpoch(jsonObj["writeTimeUTC"] as int, isUtc: true),
        writingTimeUTC: DateTime.parse(jsonObj["writingTimeUTC"] as String),
    );
  }

  Map<String, dynamic> toJson()
  {
    return {
      "title": title,
      "body": body,
      "author": author,
      "isPublic": isPublic,
      "writingTimeUTC": writingTimeUTC?.toUtc()?.toString(),
    };
  }
}