//import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';

part 'Person_model.g.dart';

@HiveType()
class Person extends HiveObject
{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  String passWord;
  @HiveField(4)
  bool isLogin;
  @HiveField(5)
  bool result;
  @HiveField(6)
  String method;
  @HiveField(7)
  String desc;

  Person({
    @required this.userName,
    @required this.email,
    this.id,
    this.passWord,
    this.isLogin = false,
    this.result,
    this.method,
    this.desc,
  });

  factory Person.fromJson(dynamic jsonObj)
  {
    String id;
    if(jsonObj["_id"] == null)
    {
      id = null;
    }
    else if(jsonObj["_id"].runtimeType == String)
    {
      id = jsonObj["_id"] as String;
    }
    else
    {
      id = (jsonObj["_id"] as ObjectId).toHexString();
    }
    return Person(
      id: id,
      userName: jsonObj["userName"] as String,
      email: jsonObj["email"] as String,
      isLogin: jsonObj["isLogin"] as bool,
      passWord: jsonObj["passWord"] as String,
//      userNameList: (jsonObj["userNameList"] as Iterable).map((v)=> v.toString()).toList(),
//      passWordList: (jsonObj["passWordList"] as Iterable).map((v)=> v.toString()).toList(),
      result: jsonObj["result"] as bool,
      method: jsonObj["method"] as String,
      desc: jsonObj["desc"] as String,
    );
  }

  Map<String, dynamic> toJson()
  {
    return {
      "_id": id,
      "userName": userName,
      "email": email,
      "passWord": passWord,
//      "userNameList": userNameList,
//      "passWordList": passWordList,
      "isLogin": isLogin,
      "result": result,
      "method": method,
      "desc": desc,
    };
  }


}
