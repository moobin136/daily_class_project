import 'package:daily_class_project/core/model/data_model.dart';
import 'package:http/http.dart' as http;

class ServerClient {
  Future<List<Comand>?> getDataMoldelServer() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var respne = await data.get(uri);
  }
}
