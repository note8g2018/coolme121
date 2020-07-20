import '../MyLibrary/import_file.dart';
import 'package:dio/dio.dart' as DIO;

abstract class LogOutController
{
  static Future<bool> logout(Person person)
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
    option.data = jsonEncode(person);
    DIO.Dio dio = DIO.Dio();
    DIO.Response response;
    response = await dio.request("/logout", options: option);
    if (response.statusCode == 200)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}