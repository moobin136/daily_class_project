import 'dart:convert';
import 'package:daily_class_project/core/model/network_respone_model.dart';
import 'package:http/http.dart';
import 'package:logger/web.dart';

class NetworkClaint {
  static Logger logger = Logger();

  ///
  static Future getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _preRequestLoger(url);

      Response response = await get(uri);
      _postRequestLoger(
        url,
        response.statusCode,
        headers: response.headers,
        responebody: response.body,
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
      _postRequestLoger(url, -1, errormassage: e.toString());
      NetworkReponse(
        isSucess: false,
        statesCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  ///post

  static Future postRequset({
    required String url,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _preRequestLoger(url, body: body);

      Response response = await post(
        uri,
        headers: {'Containt-trype': 'Application/json'},
        body: jsonEncode(body),
      );
      _postRequestLoger(
        url,
        response.statusCode,
        headers: response.headers,
        responebody: response.body,
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
      _postRequestLoger(url, -1, errormassage: e.toString());
      NetworkReponse(
        isSucess: false,
        statesCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  ///
  static void _preRequestLoger(String uri, {Map<String, dynamic>? body}) {
    logger.i('Uri : $uri\n Body : $body');
  }

  static void _postRequestLoger(
    String uri,
    int statusCode, {
    Map<String, dynamic>? headers,
    dynamic responebody,
    dynamic errormassage,
  }) {
    if (errormassage != null) {
      logger.e(
        'Uri :=> $uri\n'
        'StatusCode :=> $statusCode\n'
        'Erromasage : =>$errormassage',
      );
    }
    logger.i(
      'Uri :=> $uri\n'
      'StatusCode :=> $statusCode\n'
      'isSucess :=> $headers\n'
      'Body : =>$responebody\n',
    );
  }
}
