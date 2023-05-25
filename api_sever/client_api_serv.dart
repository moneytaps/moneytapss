import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moneytap/model/model.dart';
class FetchClient {
  var data = [];
  List<Clientlist> results = [];
  String fetchurl = "http://127.0.0.1:8080/api/client";
  Future<List<Clientlist>> getClientList() async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => Clientlist.fromJson(e)).toList();
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
