import 'dart:convert';
import 'package:daily_class_project/core/model/network_respone_model.dart';
import 'package:http/http.dart';
import 'package:logger/web.dart';



class NetworkClaint {
  static Logger logger = Logger();
  static Future getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      logger.i('Uri : $uri');
      Response response = await get(uri);
      logger.i(
        'Reponse Code : ${response.statusCode}\n'
        'isSucess : ${response.headers}\n'
        'isSucess : ${response.body}\n',
      );
      if (response.statusCode == 200) {
        final decodeJecone = jsonDecode(response.body);
        return NetworkReponse(
          isSucess: true,
          statesCode: response.statusCode,
          data: decodeJecone,
        );
      } else {
        return NetworkReponse(
          isSucess: false,
          statesCode: response.statusCode,
          errorMassage: 'Faild',
        );
      }
    } catch (e) {
      logger.e(e.toString());
      NetworkReponse(
        isSucess: false,
        statesCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  ///post

  static Future postRequset({required String url,required Map<String, dynamic> body,}) async {
    try {
      Uri uri = Uri.parse(url);
      logger.i('Uri : $uri\n Body : $body');
      Response response = await post(uri,
      headers: { 'Containt-trype': 'Application/json'},
      body: jsonEncode(body)
      

  
      );
      logger.i(
        'Reponse Code : ${response.statusCode}\n'
        'isSucess : ${response.headers}\n'
        'isSucess : ${response.body}\n',
      );
      if (response.statusCode == 200) {
        final decodeJecone = jsonDecode(response.body);
        return NetworkReponse(
          isSucess: true,
          statesCode: response.statusCode,
          data: decodeJecone,
        );
      } else {
        return NetworkReponse(
          isSucess: false,
          statesCode: response.statusCode,
          errorMassage: 'Faild',
        );
      }
    } catch (e) {
      logger.e(e.toString());
      NetworkReponse(
        isSucess: false,
        statesCode: -1,
        errorMassage: e.toString(),
      );
    }
  }
}
