//import 'dart:convert';
//import 'package:mongo_dart/mongo_dart.dart';
//import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';

part 'Person_model.g.dart';

@HiveType(typeId: 0)
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
  DateTime regTimeUTC;
  @HiveField(6)
  DateTime lastTimeLoginUTC;

  Person({
    this.userName,
    this.email,
    this.id,
    this.passWord,
    this.isLogin = false,
    this.regTimeUTC,
    this.lastTimeLoginUTC,
  });

  factory Person.fromJson(dynamic jsonObj)
  {
    return Person(
      id: jsonObj["_id"] as String,
      userName: jsonObj["userName"] as String,
      email: jsonObj["email"] as String,
      isLogin: jsonObj["isLogin"] as bool,
      passWord: jsonObj["passWord"] as String,
//      userNameList: (jsonObj["userNameList"] as Iterable).map((v)=> v.toString()).toList(),
//      passWordList: (jsonObj["passWordList"] as Iterable).map((v)=> v.toString()).toList(),
      regTimeUTC: DateTime.parse(jsonObj["regTimeUTC"] as String),
      lastTimeLoginUTC: DateTime.parse(jsonObj["lastTimeLoginUTC"] as String),
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
      "regTimeUTC": regTimeUTC?.toUtc()?.toString(),
      "lastTimeLoginUTC": lastTimeLoginUTC?.toUtc()?.toString(),
    };
  }


}
