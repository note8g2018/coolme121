

class Article
{
  String title;
  String body;
  String author;
  DateTime writeTimeUTC;
  bool isPublic;
  
  Article({
    this.title,
    this.body,
    this.author,
    this.writeTimeUTC,
    this.isPublic,
});

  factory Article.fromJson(dynamic jsonObj)
  {
//    DateTime _dateTime;
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
      writeTimeUTC: jsonObj["writeTimeUTC"] as DateTime,
      isPublic: jsonObj["isPublic"] as bool,
    );
  }

  Map<String, dynamic> toJson()
  {
    return {
      "title": title,
      "body": body,
      "author": author,
      "writeTimeUTC": writeTimeUTC?.toUtc(),
      "isPublic": isPublic,
    };
  }
}