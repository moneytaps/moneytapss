import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moneytap/model/model.dart';
class FetchClient2 {
  var data = [];
  List<Clientlist> results = [];
  String fetchurl = "http://127.0.0.1:8080/loan_status";
  Future<http.Response> getClientList() async {
    var url = Uri.parse(fetchurl);
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => Clientlist.fromJson(e)).toList();
        return response;
      } else {
        print('api error');
        throw 'error';
      }
    } on Exception catch (e) {
      print('error: $e');
      throw e.toString();
    }

  }
}
