//import 'dart:io';
//import 'model/Person_model.dart';
//import 'package:flutter/material.dart';
//import 'screen/MyApp_screen.dart';
//import 'package:hive/hive.dart';
////import 'package:hive_flutter/hive_flutter.dart';
//import 'package:path_provider/path_provider.dart' as path;
//import 'package:mongo_dart/mongo_dart.dart';

import 'MyLibrary/import_file.dart';
import 'package:path_provider/path_provider.dart' as path;

const String GlobalPersonBoxLog = "GlobalPersonBoxLog";
const String myAppID = "coolme";
const String urld =
    'mongodb://note8g2018:123456789@localhost:27017/flutter?authSource=admin';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  //await MongoStitchClient.initializeApp(urld);
  final Directory _directory = await path.getApplicationDocumentsDirectory();
  final String _hivePath = _directory.path;
  debugPrint(_hivePath);
  Hive.init(_hivePath);
  //await Hive.initFlutter();
  //Hive.registerAdapter<ObjectId>(ObjectId(), 0);
  Hive.registerAdapter<Person>(PersonAdapter(),0);
  await Hive.openBox<Person>(GlobalPersonBoxLog);

  runApp(MyApp());
}




