import '../MyLibrary/import_file.dart';
import 'package:dio/dio.dart' as DIO;
//import '../model/TravelMessage_model.dart';

abstract class Registration
{
  static Future<TravelMessage> CheckUserName({Map<String, dynamic> jsonObj})
  async {
    TravelMessage travelMessage = TravelMessage();
    //const String url = 'http://coolme.me:8888';
    const String url = 'http://192.168.1.100:8888';
    DIO.RequestOptions option = DIO.RequestOptions();
    option.responseType = DIO.ResponseType.json;
//    option.connectTimeout = 5000;
    option.baseUrl = url;
    option.contentType = DIO.Headers.jsonContentType;
    option.method = 'POST';
    option.data = jsonEncode(jsonObj);
    DIO.Dio dio = DIO.Dio();
    DIO.Response response;
    try{
      response = await dio.request("/checkusername", options: option);
    }catch(e)
    {
      print("error");
      print(e);
      travelMessage.result = false;
      travelMessage.description = "Be sure Your Internet is Working";
      return travelMessage;
    }
    if (response.statusCode == 200)
    {
      final Map<String, dynamic> data = jsonDecode(response.data);
      //final TravelMessage travelMessage = TravelMessage.fromJson(response.data);
      travelMessage.result = data["result"] as bool;
      travelMessage.description = data["description"] as String;
      return travelMessage;
    }
    else
    {
      travelMessage.result = false;
      travelMessage.description = "There is error with status code ${response.statusCode}";
      return travelMessage;
    }
  }

  static Future<TravelMessage> CheckEmail({Map<String, dynamic> jsonObj})
  async {
    TravelMessage travelMessage = TravelMessage();
    //const String url = 'http://coolme.me:8888';
    const String url = 'http://192.168.1.100:8888';
    DIO.RequestOptions option = DIO.RequestOptions();
    option.responseType = DIO.ResponseType.json;
//    option.connectTimeout = 5000;
    option.baseUrl = url;
    option.contentType = DIO.Headers.jsonContentType;
    option.method = 'POST';
    option.data = jsonEncode(jsonObj);
    DIO.Dio dio = DIO.Dio();
    DIO.Response response;
    try{
      response = await dio.request("/checkemail", options: option);
    }catch(e)
    {
      print("error");
      print(e);
      travelMessage.result = false;
      travelMessage.description = "Be sure Your Internet is Working";
      return travelMessage;
    }
    if (response.statusCode == 200)
    {
      final Map<String, dynamic> data = jsonDecode(response.data);
      //final TravelMessage travelMessage = TravelMessage.fromJson(response.data);
      travelMessage.result = data["result"] as bool;
      travelMessage.description = data["description"] as String;
      return travelMessage;
    }
    else
    {
      travelMessage.result = false;
      travelMessage.description = "There is error with status code ${response.statusCode}";
      return travelMessage;
    }
  }

  static Future<TravelMessage> register({Map<String, dynamic> jsonObj})
  async {
    TravelMessage travelMessage = TravelMessage();
    //const String url = 'http://coolme.me:8888';
    const String url = 'http://192.168.1.100:8888';
    DIO.RequestOptions option = DIO.RequestOptions();
    option.responseType = DIO.ResponseType.json;
//    option.connectTimeout = 5000;
    option.baseUrl = url;
    option.contentType = DIO.Headers.jsonContentType;
    option.method = 'POST';
    option.data = jsonEncode(jsonObj);
    DIO.Dio dio = DIO.Dio();
    DIO.Response response;
    try{
      response = await dio.request("/reg", options: option);
    }catch(e)
    {
      print("error");
      print(e);
      travelMessage.result = false;
      travelMessage.description = "Be sure Your Internet is Working";
      return travelMessage;
    }
    if (response.statusCode == 200)
    {
      final Map<String, dynamic> data = jsonDecode(response.data);
      //final TravelMessage travelMessage = TravelMessage.fromJson(response.data);
      travelMessage.result = data["result"] as bool;
      travelMessage.description = data["description"] as String;
      return travelMessage;
    }
    else
    {
      travelMessage.result = false;
      travelMessage.description = "There is error with status code ${response.statusCode}";
      return travelMessage;
    }
  }

}
